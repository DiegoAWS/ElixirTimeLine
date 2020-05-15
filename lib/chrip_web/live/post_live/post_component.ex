defmodule ChripWeb.PostLive.PostComponent do

use ChripWeb, :live_component

def render(assigns) do
~L"""
<div id="post-<%= @post.id%>" class="post" style="margin: 5px; padding: 2px;">
  <div class="row">
    <div class="column column-10">
      <div style="border-radius: 5px; height: 50px; background-color: red;"></div>
    </div>
    <div class="column column-80 " style="border-radius: 5px; background-color:darkturquoise;">
      <b>@<%= @post.username %></b>
      <br>

      <%= @post.body%>
    </div>
  </div>

  <div class="row">
    <div class="column col-3 border">
      <a href="#" phx-click="like" phx-target="<%= @myself %>">

        Like <%= @post.likes_counter%>

      </a>
    </div>
    <div class="column col-3">
      <a href="#" phx-click="repost" phx-target="<%= @myself %>">

      RePost <%= @post.reposts_count%></div>

      </a>

      <div class="column col-3">

      <%= live_patch "Edit", to: Routes.post_index_path(@socket, :edit, @post)%>

    </div>

    <div class="column col-3">
      <%= link "Delete", to: "#", phx_click: "delete", phx_value_id: @post.id,data: [confirm: "Are you Sure?"]%>
    </div>
  </div>




</div>
"""
end

def handle_event("like", _, socket) do
  Chrip.Timeline.inc_likes(socket.assigns.post)
  {:noreply, socket}
end


def handle_event("repost", _, socket) do
  Chrip.Timeline.inc_reposts(socket.assigns.post)
  {:noreply, socket}
end


end
