#ifndef PLOTTER_H
#define PLOTTER_H

#include <QMap>
#include <QPixmap>
#include <QVector>
#include <QWidget>
#include <logging/logger.h>
#include "qglyphs.h"
#include "plotpainter.h"

class QToolButton;


namespace QtAddons {

class Plotter : public QWidget
{
    Q_OBJECT
    kipl::logging::Logger logger;
public:
    Plotter(QWidget *parent = 0);

    void setPlotSettings(const PlotSettings &settings);
    void setCurveData(int id, const QVector<QPointF> &data);
    void setCurveData(int id, float const * const x, float const * const y, const int N);
    void setCurveData(int id, float const * const x, size_t const * const y, const int N);
    void clearCurve(int id);
    void clearAllCurves();

    void setPlotCursor(int id, PlotCursor c);
    void clearPlotCursor(int id);
    void clearAllPlotCursors();

    QSize minimumSizeHint() const;
    QSize sizeHint() const;
    bool ShowGrid;

public slots:
    void zoomIn();
    void zoomOut();

protected:
    void paintEvent(QPaintEvent *event);
    void resizeEvent(QResizeEvent *event);
    void mousePressEvent(QMouseEvent *event);
    void mouseMoveEvent(QMouseEvent *event);
    void mouseReleaseEvent(QMouseEvent *event);
    void keyPressEvent(QKeyEvent *event);
    void wheelEvent(QWheelEvent *event);

private:
    void updateRubberBandRegion();
    void refreshBounds();
    void refreshPixmap();
    void drawGrid(QPainter *painter);
    void drawCurves(QPainter *painter);
    void drawCursors(QPainter *painter);

    enum { Margin = 30 };

    QToolButton *zoomInButton;
    QToolButton *zoomOutButton;
    QMap<int, PlotData > curveMap;
    QMap<int, PlotCursor > cursorMap;
    QVector<PlotSettings> zoomStack;
    int curZoom;
    bool rubberBandIsShown;
    QRect rubberBandRect;
    QPixmap pixmap;
};



}

#endif
