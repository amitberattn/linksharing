package com.linksharing

class Resource {

    String description
    Date dateCreated
    Date lastUpdated
    static belongsTo = [
            createdBy:UserDetail,
            topic:Topic
    ]
    static hasMany = [
            readingItem:ReadingItem,
            resourceRating:ResourceRating
    ]
    static mapping = {
        tablePerHierarchy false
    }
    static constraints = {
        description()
        createdBy()
        topic()
        dateCreated()
        lastUpdated()
    }
}