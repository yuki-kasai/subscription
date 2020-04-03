// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

<!DOCTYPE html>
<html>
<head>
  <title>DeviseBootstrapViews</title>
  <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track' => true %>
  <%= javascript_include_tag 'application', 'data-turbolinks-track' => true %>
  <%= csrf_meta_tags %>
</head>
<body>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">
        <%= image_tag('bootstrap.png',size: "25") %>
      </a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav navbar-right">
      <% if user_signed_in? %>
       	<li>
       		<%= link_to('Logout', destroy_user_session_path, :method => :delete) %>
       	</li>
      <% else %>
       	<li>
       		<%= link_to('Login', new_user_session_path)  %>
       	</li>
       <% end %>
    </ul>
    </div>
  </div>
</nav>
<%= flash_messages %>
<div class="col-md-offset-2 col-md-8">
<%= yield %>
</div>
</body>
</html>
