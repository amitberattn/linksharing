package com.linksharing

import com.linksharing.Seriousness
import com.linksharing.Topic

class Subscription {

    Seriousness seriousness
    Date dateCreated

    static belongsTo = [topic:Topic,userDetail:UserDetail]
    static mapping = {sort(dateCreated: 'desc')}
    static constraints = {
        topic (unique: 'userDetail')
        userDetail()
        seriousness()
        dateCreated(format:'yyyy-MM-dd')
    }
}
