import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
      <li class="comment">
        <div class="comment-text mr-3">
          <pre>${data.content.text}</pre>
        </div>
        <div class="comment-right">
          <div class="comment-user">
            <p>by ${data.user}</p>
          </div>
          <div class="comment-delete mr-3">
            <a rel="nofollow" data-method="delete" href="/groups/group_id: params[:group_id]/posts/post_id: params[:post_id]/comments/${data.content.id}">コメントを削除</a>
          </div>
        </div>
      </li>
                `;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_text');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value='';
  }
});


/* <h3>mini_talk_app</h3>
<%= form_with model: @message do |f| %>
  <%= f.text_field :text %>
  <%= f.submit '送信' %>
<% end %>
<div id='messages'>
  <% @messages.reverse_each do |message| %>
    <p><%= message.text %></p>
  <% end %>
</div> */