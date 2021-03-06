//<LICENSE>
#include "imageviewerwidget.h"

#include <iostream>
#include <sstream>
#include <cmath>

#include <QMenu>
#include <QMessageBox>
#include <QToolTip>
#include <QStylePainter>
#include <QSignalBlocker>
#include <QDebug>
#include <QApplication>
#include <QClipboard>
#include <QFileDialog>
#include <QDir>

#include <base/kiplenums.h>

#include "setgraylevelsdlg.h"
namespace QtAddons {

int ImageViewerWidget::m_nViewerCounter = -1;
//QList<ImageViewerWidget *> ImageViewerWidget::s_ViewerList = QList<ImageViewerWidget *>();

ImageViewerWidget::ImageViewerWidget(QWidget *parent) :
    QWidget(parent),
    logger("ImageViewerWidget"),
    m_ImagePainter(this),
    m_rubberBandLine(QRubberBand::Line, this),
    m_RubberBandStatus(RubberBandHide),
    m_MouseMode(ViewerROI),
    m_PressedButton(Qt::NoButton),
    m_mouseMoved(false),
    m_infoDialog(this),
    m_CurrentScale(1.0),
    saveImageAct(nullptr),
    copyImageAct(nullptr)
{
    QPalette palette;
    palette.setColor(QPalette::Background,Qt::black);
    setAutoFillBackground(true);
    setPalette(palette);
    setSizePolicy(QSizePolicy::Expanding, QSizePolicy::Expanding);
    setFocusPolicy(Qt::ClickFocus);
    setCursor(Qt::CrossCursor);
    this->setMouseTracking(true);
    m_nViewerCounter++;
    m_sViewerName = QString("ImageViewer ")+QString::number(m_nViewerCounter);
    //s_ViewerList.push_back(this);
    m_infoDialog.setModal(false);

    connect(this,&ImageViewerWidget::levelsChanged,this,&ImageViewerWidget::on_levelsChanged);
    setupActions();
}

ImageViewerWidget::~ImageViewerWidget()
{
    //s_ViewerList.removeOne(this);
    m_infoDialog.close();
}

QString ImageViewerWidget::viewerName()
{
    return m_sViewerName;
}

void ImageViewerWidget::set_viewerName(QString &name)
{
    m_sViewerName = name;
}

QSize ImageViewerWidget::minimumSizeHint() const
{
    return QSize(6 * Margin, 4 * Margin);
}

QSize ImageViewerWidget::sizeHint() const
{
    return QSize(256, 256);
}

void ImageViewerWidget::ShowContextMenu(const QPoint& pos) // this is a slot
{
    logger(kipl::logging::Logger::LogMessage,"Context menu");
    // for most widgets
    QPoint globalPos = this->mapToGlobal(pos);
    // for QAbstractScrollArea and derived classes you would use:
    // QPoint globalPos = myWidget->viewport()->mapToGlobal(pos);

    QMenu viewerMenu(this);

    viewerMenu.addAction(saveImageAct);
    viewerMenu.addAction(copyImageAct);
    viewerMenu.exec(globalPos);
//    viewerMenu.addAction("Full Image");
//    viewerMenu.addAction("Set Levels");
//    // ...

//    QAction* selectedItem = viewerMenu.exec(globalPos);
//    if (selectedItem)
//    {
//        if (selectedItem->text() == "Full Image") {
//            logger(kipl::logging::Logger::LogMessage,"Full Image");
//        }
//        if (selectedItem->text() == "Set Levels") {
//            logger(kipl::logging::Logger::LogMessage,"Set Levels");
//        }
//    }
//    else
//    {
//        // nothing was chosen
//        logger(kipl::logging::Logger::LogMessage,"Menu was canceled");
//    }
}

void ImageViewerWidget::on_levelsChanged(float lo, float hi)
{
}

void ImageViewerWidget::saveCurrentView()
{
    QString destname=QFileDialog::getSaveFileName(this,"Where should the image be saved?",QDir::homePath()+"/image.png");

    saveImage(destname);
}

void ImageViewerWidget::copyImage()
{
    QClipboard *clipboard = QApplication::clipboard();
    auto wsize = m_ImagePainter.zoomedImageSize();
    const int w=1024;
    if (wsize.width()<w)
    {
        wsize = QSize(w,static_cast<int>(w*static_cast<float>(wsize.height())/static_cast<float>(wsize.width())));
    }

    QPixmap p( wsize );
    QPainter painter(&p);
    painter.fillRect(QRect(0,0,wsize.width(),wsize.height()),QColor("lightgray"));
    m_ImagePainter.Render(painter,0,0,wsize.width(),wsize.height());

    clipboard->setPixmap(p);

}

void ImageViewerWidget::saveImage(const QString &fname)
{
    if (!fname.isEmpty())
    {
        auto wsize = m_ImagePainter.zoomedImageSize();
        const int w=1024;
        if (wsize.width()<w)
        {
            wsize = QSize(w,static_cast<int>(w*static_cast<float>(wsize.height())/static_cast<float>(wsize.width())));
        }

        QPixmap p( wsize );
        QPainter painter(&p);
        painter.fillRect(QRect(0,0,wsize.width(),wsize.height()),QColor("lightgray"));
        m_ImagePainter.Render(painter,0,0,wsize.width(),wsize.height());
        p.save(fname,"PNG");
    }
    else
    {
        QMessageBox::warning(this,"No file name","Please provide a file name to save the image.");
    }
}

void ImageViewerWidget::setupActions()
{
    copyImageAct = new QAction(tr("&Copy image"), this);
    copyImageAct->setShortcuts(QKeySequence::Copy);
    copyImageAct->setStatusTip(tr("Copy the current selection's contents to the "
                             "clipboard"));
    connect(copyImageAct, &QAction::triggered, this, &ImageViewerWidget::copyImage);

    saveImageAct = new QAction(tr("&Save image"), this);
    saveImageAct->setShortcuts(QKeySequence::Cut);
    saveImageAct->setStatusTip(tr("Cut the current selection's contents to the "
                            "clipboard"));

    connect(saveImageAct,&QAction::triggered, this, &ImageViewerWidget::saveCurrentView );
}

void ImageViewerWidget::paintEvent(QPaintEvent * ) // event
{

    QPainter painter(this);
    QSize s=this->size();

    m_ImagePainter.Render(painter,0,0,s.width(),s.height());

    if (m_RubberBandStatus != RubberBandHide)
    {
        painter.setPen(palette().light().color());
        painter.drawRect(rubberBandRect.normalized()
                                       .adjusted(0, 0, -1, -1));
    }
}

void ImageViewerWidget::resizeEvent(QResizeEvent *event )
{
    widgetSize = event->size();
    // Call base class impl
    QWidget::resizeEvent(event);
}

void ImageViewerWidget::keyPressEvent(QKeyEvent *event)
{
    if (!this->hasFocus())
        return;
    char keyvalue=event->key();

    ostringstream msg;

    switch (keyvalue)
    {
    case 'm':
    case 'M':
        ShowContextMenu(QPoint(100,100));
        break;
//    case 'z':
//    case 'Z':
//        setCursor(Qt::SizeBDiagCursor);
//        m_MouseMode=ViewerZoom;
//        break;
    case 'i':
    case 'I':
        if (m_infoDialog.isVisible())
            m_infoDialog.close();
        else
            m_infoDialog.show();
        break;
    case 'p':
    case 'P':
        setCursor(Qt::OpenHandCursor);
        m_MouseMode=ViewerPan;
        break;
    case 'l':
    case 'L':
    {
        float lo;
        float hi;

        get_levels(&lo, &hi);

        SetGrayLevelsDlg dlg(this);
        int res=dlg.exec();

        if (res==QDialog::Rejected)
        {
            set_levels(lo,hi);
        }
        break;
    }
    case 'k':
    case 'K':
        setCursor(Qt::PointingHandCursor);
        m_MouseMode=ViewerProfile;
        break;
    case 'r':
    case 'R':
        setCursor(Qt::CrossCursor);
        m_MouseMode=ViewerROI;
        break;
    case '+':
        m_ImagePainter.zoomIn(nullptr);
        break;
    case '-':
        m_ImagePainter.zoomOut();
        break;
    }
}

void ImageViewerWidget::enterEvent(QEvent *)
{
  // logger(kipl::logging::Logger::LogMessage,"Entered");

}

void ImageViewerWidget::mousePressEvent(QMouseEvent *event)
{

    QRect rect(Margin, Margin,
               width() - 2 * Margin, height() - 2 * Margin);

    if (m_RubberBandStatus != RubberBandHide)
    {
        m_RubberBandStatus = RubberBandHide;
        updateRubberBandRegion();
    }

    if (event->button() == Qt::LeftButton)
    {
        if (m_MouseMode==ViewerROI)
            if (rect.contains(event->pos())) {
                if (rubberBandRect.contains(event->pos()))
                {
                    logger(logger.LogMessage,"Moving ROI");
                    m_RubberBandStatus = RubberBandMove;
                    updateRubberBandRegion();
                }
                else
                {
                    m_RubberBandStatus = RubberBandDrag;
                    rubberBandRect.setTopLeft(event->pos());
                    rubberBandRect.setBottomRight(event->pos());
                    updateRubberBandRegion();
                    setCursor(Qt::CrossCursor);
                }
            }
        if (m_MouseMode==ViewerProfile)
        {
                m_rubberBandOrigin = event->pos();
                m_rubberBandLine.setGeometry(QRect(m_rubberBandOrigin, QSize()));
                m_rubberBandLine.show();
        }
        if (m_MouseMode==ViewerPan)
        {

        }
    }
    if (event->button() == Qt::RightButton)
    {
        m_PressedButton=event->button();
    }

    m_LastMotionPosition=event->pos();

   QWidget::mousePressEvent(event);
}

void ImageViewerWidget::mouseMoveEvent(QMouseEvent *event)
{
    QSignalBlocker blocker(this);
    std::ostringstream msg;
    int x = event->pos().x();
    int y = event->pos().y();
    int dx= x - m_LastMotionPosition.x();
    int dy= y - m_LastMotionPosition.y();

    if (m_RubberBandStatus == RubberBandDrag)
    {

        updateRubberBandRegion();
        rubberBandRect.setBottomRight(event->pos());
        updateRubberBandRegion();
    }
    else if (m_RubberBandStatus == RubberBandMove)
    {
        updateRubberBandRegion();
        const int w=10;
        QRect r0 = QRect(rubberBandRect.x()-w,
                         rubberBandRect.y()-w,
                         rubberBandRect.width()+2*w,
                         rubberBandRect.height()+2*w);
        QRect r1 = QRect(rubberBandRect.x()+w,
                         rubberBandRect.y()+w,
                         rubberBandRect.width()-2*w,
                         rubberBandRect.height()-2*w);

        if ((r0.contains(event->pos())==true) && (r1.contains(event->pos())==false))
        {
            rubberBandRect.translate(dx,dy);
            updateRubberBandRegion();
        }
    }

    if (m_MouseMode==ViewerProfile)
        m_rubberBandLine.setGeometry(QRect(m_rubberBandOrigin, event->pos()).normalized());

    if (m_MouseMode==ViewerPan)
    {
        m_ImagePainter.panImage(dx/m_ImagePainter.getScale(),dy/m_ImagePainter.getScale());
    }


    QPoint tooltipOffset(0,0);
    if (m_PressedButton == Qt::RightButton)
    {
        float minlevel, maxlevel;

        get_levels(&minlevel, &maxlevel);

        float fWindow=maxlevel-minlevel;
        float fLevel=minlevel+fWindow/2.0f;

        float fLevelStep  = fWindow/1000.0f;
        float fWindowStep = fWindow/1000.0f;
        msg.str("");

        if (abs(dx)<abs(dy))
            fLevel+=dy*fLevelStep;
        else
            fWindow+=dx*fWindowStep;

        msg<<"W="<<fWindow<<", L="<<fLevel;

        showToolTip(event->globalPos()+tooltipOffset,QString::fromStdString(msg.str()));
        set_levels(fLevel-fWindow/2.0f,fLevel+fWindow/2.0f);
    }
    else
    {
        QRect roi=m_ImagePainter.getCurrentZoomROI();

        QPoint pos(static_cast<int>( m_ImagePainter.globalPositionX((event->pos().x()-m_ImagePainter.getOffsetx())/m_ImagePainter.getScale()) ),
                   static_cast<int>( m_ImagePainter.globalPositionY((event->pos().y()-m_ImagePainter.getOffsety())/m_ImagePainter.getScale()) ) );

        if(roi.contains(pos)==true)
        {
            msg.str("");

            msg<<m_ImagePainter.getValue(pos.x(),pos.y())<<" @ ("<<pos.x()<<", "<<pos.y()<<")";

            showToolTip(event->globalPos()+tooltipOffset,QString::fromStdString(msg.str()));
        }
    }

    m_LastMotionPosition=event->pos();

    QWidget::mouseMoveEvent(event);
}

void ImageViewerWidget::mouseReleaseEvent(QMouseEvent *event)
{
    std::ostringstream msg;
    if ((event->button() == Qt::LeftButton))
    {
        if ((m_RubberBandStatus == RubberBandDrag) || (m_RubberBandStatus == RubberBandMove))
        {
            updateRubberBandRegion();

            QRect r=rubberBandRect.normalized();
        //    auto dims=m_ImagePainter.imageDims();
            int xpos = m_ImagePainter.globalPositionX(floor((r.x()-m_ImagePainter.getOffsetx())/m_ImagePainter.getScale()));
            int ypos = m_ImagePainter.globalPositionY(floor((r.y()-m_ImagePainter.getOffsety())/m_ImagePainter.getScale()));

            int w    = floor(r.width()/m_ImagePainter.getScale());
            int h    = floor(r.height()/m_ImagePainter.getScale());

            xpos = xpos < 0 ? 0 : xpos;
            ypos = ypos < 0 ? 0 : ypos;
            auto currentZoomROI = m_ImagePainter.getCurrentZoomROI();
            w = currentZoomROI.width()+currentZoomROI.x()  <= xpos + w ? currentZoomROI.width()  + currentZoomROI.x() - xpos-1 : w;
            h = currentZoomROI.height()+currentZoomROI.y() <= ypos + h ? currentZoomROI.height() + currentZoomROI.y() - ypos-1 : h;

            roiRect.setRect(xpos, ypos, w, h);

            roiRect=roiRect.normalized();

            m_RubberBandStatus = RubberBandFreeze;
//             qDebug() << "Mouse released:" <<roiRect<< m_ImagePainter.getScale();
            m_infoDialog.updateInfo(m_ImagePainter.getImage(), roiRect);
        }
        if (m_MouseMode==ViewerProfile)
        {
            m_rubberBandLine.hide();
        }
        if (m_MouseMode==ViewerPan)
        {
            m_MouseMode=ViewerROI;
        }
    }


    if (event->button() == Qt::RightButton )
    {
        m_PressedButton = Qt::NoButton;
    }


    QWidget::mouseReleaseEvent(event);
}

void ImageViewerWidget::updateRubberBandRegion()
{
    QRect rect = rubberBandRect.normalized();

    if (m_MouseMode==ViewerROI)
    {
        update(rect.left(), rect.top(), rect.width(), 1);
        update(rect.left(), rect.top(), 1, rect.height());
        update(rect.left(), rect.bottom(), rect.width(), 1);
        update(rect.right(), rect.top(), 1, rect.height());
    }
}

void ImageViewerWidget::showToolTip(QPoint position, QString message)
{
    QFont ttfont=this->font();
    ttfont.setPointSize(static_cast<int>(ttfont.pointSize()*0.9));
    QPalette color;

#if QT_VERSION < 0x050000
    color.setColor( QPalette::Active,QPalette::QPalette::ToolTipBase,Qt::yellow);
#else
//    color.setColor(QPalette::Active,QPalette::QPalette::ToolTipBase,QColor::yellow());
#endif

    QPoint ttpos=position;

    QToolTip::setPalette(color);
    QToolTip::setFont(ttfont);

    QToolTip::showText(ttpos, message,this);

}

void ImageViewerWidget::set_image(float const * const data, const std::vector<size_t> & dims)
{
    QMutexLocker locker(&m_ImageMutex);
    std::ostringstream msg;
    m_ImagePainter.setImage(data,dims);
    roiRect.setRect(0,0,1,1);
    rubberBandRect.setRect(0,0,1,1);

    m_infoDialog.setHistogram(m_ImagePainter.getImageHistogram());
    float mi,ma;
    m_ImagePainter.getImageMinMax(&mi,&ma);

    QRect rect=QRect(0,0,(int)dims[0],(int)dims[1]);

    emit newImageDims(rect);
}

QRect ImageViewerWidget::get_marked_roi()
{
    m_RubberBandStatus = RubberBandHide;
    updateRubberBandRegion();
    rubberBandRect=QRect(0,0,1,1);
    return roiRect;
}

void ImageViewerWidget::set_image(float const * const data, const std::vector<size_t> &dims, const float low, const float high)
{
    QMutexLocker locker(&m_ImageMutex);
    m_ImagePainter.setImage(data,dims,low,high);
    roiRect.setRect(0,0,1,1);
    rubberBandRect.setRect(0,0,1,1);

    m_infoDialog.setHistogram(m_ImagePainter.getImageHistogram());

    QRect rect=QRect(0,0,(int)dims[0],(int)dims[1]);

    emit newImageDims(rect);
}

void ImageViewerWidget::getImageDims(int &x, int &y)
{
    auto dims=m_ImagePainter.imageDims();
    x=dims[0];
    y=dims[1];
}

void ImageViewerWidget::set_plot(QVector<QPointF> data, QColor color, int idx)
{
    QMutexLocker locker(&m_ImageMutex);
    m_ImagePainter.setPlot(data,color,idx);
}

void ImageViewerWidget::clear_plot(int idx)
{
    QMutexLocker locker(&m_ImageMutex);
    m_ImagePainter.clearPlot(idx);
}

void ImageViewerWidget::set_rectangle(QRect rect, QColor color, int idx)
{
    QMutexLocker locker(&m_ImageMutex);
    m_ImagePainter.setRectangle(rect,color,idx);
}

void ImageViewerWidget::clear_rectangle(int idx)
{
    QMutexLocker locker(&m_ImageMutex);
    m_ImagePainter.clearRectangle(idx);
}

void ImageViewerWidget::set_marker(QMarker marker, int idx)
{
    QMutexLocker locker(&m_ImageMutex);
    m_ImagePainter.setMarker(marker,idx);
}

void ImageViewerWidget::clear_marker(int idx)
{
    QMutexLocker locker(&m_ImageMutex);
    m_ImagePainter.clearMarker(idx);
}

void ImageViewerWidget::hold_annotations(bool hold)
{
    m_ImagePainter.holdAnnotations(hold);
}

void ImageViewerWidget::clear_viewer()
{
    QMutexLocker locker(&m_ImageMutex);
    m_ImagePainter.clear();
}

void ImageViewerWidget::set_levels(const float level_low, const float level_high, bool updatelinked)
{
    QMutexLocker locker(&m_ImageMutex);
    m_ImagePainter.setLevels(level_low,level_high);
    if (updatelinked)
    {
        UpdateLinkedViewers();
    }

    emit levelsChanged(level_low,level_high);
}

void ImageViewerWidget::set_levels(kipl::base::eQuantiles quantile, bool updatelinked)
{
    QMutexLocker locker(&m_ImageMutex);

    m_ImagePainter.setLevels(quantile);
    if (updatelinked)
    {
        UpdateLinkedViewers();
    }

    float level_low,level_high;

    m_ImagePainter.getLevels(&level_low,&level_high);

    emit levelsChanged(level_low,level_high);
}

void ImageViewerWidget::get_levels(float *level_low, float *level_high)
{
    m_ImagePainter.getLevels(level_low,level_high);
}

void ImageViewerWidget::get_minmax(float *level_low, float *level_high)
{
    m_ImagePainter.getImageMinMax(level_low,level_high);
}

void ImageViewerWidget::show_clamped(bool show)
{
    m_ImagePainter.showClamped(show);
}

const QVector<QPointF> & ImageViewerWidget::get_histogram()
{
    return m_ImagePainter.getImageHistogram();
}

void ImageViewerWidget::LinkImageViewer(QtAddons::ImageViewerWidget *w, bool connect)
{
    m_LinkedViewers.insert(w);
    if (connect)
    {
        w->LinkImageViewer(this,false);
    }
}

void ImageViewerWidget::ClearLinkedImageViewers(QtAddons::ImageViewerWidget *w)
{
    if (w)
    {
        QSet<ImageViewerWidget *>::iterator i=m_LinkedViewers.find(w);
        m_LinkedViewers.erase(i);
    }
    else
    {
        QSetIterator<ImageViewerWidget *> i(m_LinkedViewers);
        while (i.hasNext())
             i.next()->ClearLinkedImageViewers(this);

        m_LinkedViewers.clear();
    }
}

void ImageViewerWidget::UpdateFromLinkedViewer(QtAddons::ImageViewerWidget *w)
{
    float level_low, level_high;
    w->get_levels(&level_low, &level_high);
    set_levels(level_low, level_high,false);
}

void ImageViewerWidget::UpdateLinkedViewers()
{
    if (!m_LinkedViewers.empty())
    {
        QSetIterator<ImageViewerWidget *> i(m_LinkedViewers);
         while (i.hasNext())
             i.next()->UpdateFromLinkedViewer(this);
    }
}



}

