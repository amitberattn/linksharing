package com.linksharing

import grails.transaction.Transactional

@Transactional
class HeaderMenuService {

    def serviceMethod() {

    }

    def getSubscribedTopic(Long uid) {
        //UserDetail userDetail = UserDetail.load(uid)
        User user = User.get(uid)
        List<Subscription> subscriptionList = Subscription.findAllByUserDetail(user)
        List<Topic> topicList = subscriptionList.topic as List<Topic>
        String renderHtmlString = ""
        topicList.each {it->
            renderHtmlString = renderHtmlString+"<option value=${it.id}>${it.name}</option>"
        }
        return renderHtmlString
    }
}
