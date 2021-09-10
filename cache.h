#ifndef CACHE_H
#define CACHE_H

#include <QObject>
#include <map>

struct InOutput
{
    QString input;
    QString output;
};

class Cache  : public QObject
{
    Q_OBJECT
public:
    explicit Cache (QObject *parent = nullptr);

signals:
public slots:
    void store(QString input, QString output);
    const QString get(QString data);
    bool has(QString data);

private:
    std::map<QString, QString> cacheMap;
};

#endif // CACHE_H
