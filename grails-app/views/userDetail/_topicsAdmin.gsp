<ul>
    <g:each in="${topicList}" status="i" var="topic">
        <li>
            <g:form controller="subscription" action="update" class="edit-subscription">
                <article class="entry-item clearfix">
                    <div class="entry-thumb"><a href="#"><img
                            src="${resource(dir: 'images/profile', file: "${topic.createdBy.username ?: 'user.png'}")}"
                            alt=""/></a></div>

                    <table>
                        <tr class="entry-content show-text">
                            <th colspan="4" style="text-align: left;"><g:link controller="topic" action="show"
                                                                              id="${topic.id}">${topic.name}</g:link></th>
                        </tr>
                        <tr class="entry-content edit-text" style="display: none;">
                            <g:field type="hidden" name="id" value="${topic.id}"/>
                            <th colspan="2"><g:textField name="topic.name"
                                                         value="${topic.name}"/></th>
                            <th><g:submitButton name="editTopic" value="Save"
                                                class="form-input-button-blue"/></th>
                            <th><input type="reset" value="Cancel" class="form-input-button-blue"/></th>
                        </tr>
                        <tr class="entry-content">
                            <th colspan="2">@${topic.createdBy.username}</th>
                            <th>Subscriptions</th>
                            <th>Post</th>
                        </tr>
                        <tr class="entry-content">
                            <g:if test="${topic.subscription != null}">

                                <g:if test="${userDetail?.id in topic.subscription.userDetail.id.asList()}">
                                    <td colspan="2">
                                        <g:link controller="userDetail" action="unsubscribeTopic"
                                                id="${topic.id}">${topic.createdBy.id == userDetail?.id ? "" : "Unsubscribe"}</g:link>
                                    </td>
                                </g:if>
                                <g:else>
                                    <td colspan="2">
                                        <g:link controller="userDetail" action="subscribeTopic"
                                                id="${topic.id}">Subscription</g:link>
                                    </td>
                                </g:else>
                            </g:if>
                            <td><a href="href">${topic.subscription.size()}</a></td>
                            <td><a href="href">${topic.resource.size()}</a></td>

                        </tr>

                    </table>
                    <g:select name="topic.seriousness" from="${com.linksharing.Seriousness}"
                              value="${com.linksharing.Seriousness.Serious}" required="required"></g:select>

                        <g:select name="topic.visibility" from="${com.linksharing.Visibility}"
                                  value="${topic.visibility}" required="required"></g:select>
                    <div class="edit">
                        <a href="#" class="invite"><asset:image src="placeholders/email-icon.png"
                                                                class="modal-form" alt=""/></a>
                            <a href="#" class="edit-topic"><asset:image src="placeholders/editor.png" alt=""/></a>
                            <a href="#"><asset:image src="placeholders/trash.png" alt=""/></a>
                    </div>
                </article>
            </g:form>
        </li>
    </g:each>
</ul>

<div class="paginateButtons">
    <util:remotePaginate total="${totalTopic}" update="adminTopics" controller="userDetail" action="trendingTopicsPagination" pageSizes="[5: '5 on Page',10:'10 on Page',15:'15 on Page']" prev="${"<<"}" next="${">>"}"/>
</div>
