#include "cache.h"
#include <QDebug>

Cache::Cache (QObject *parent) : QObject(parent)
{

}

void Cache::store(QString input, QString output)
{
    cacheMap.emplace(input, output);
}

const QString Cache::get(QString data)
{
    if(this->has(data))
        return cacheMap.at(data);
    else
        return "Error";
}

bool Cache::has(QString data)
{
    std::map<QString, QString>::iterator it;
    it = cacheMap.find(data);

    if(it != cacheMap.end())
        return true;
    else
        return false;
}
