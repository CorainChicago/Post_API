@Posts = React.createClass

  getInitialState: ->
        posts: @props.data

  getDefaultProps: ->
        posts: []

  deletePost: (post) ->
    index = @state.posts.indexOf post
    posts = React.addons.update(@state.posts, { $splice: [[index, 1]] })
    @replaceState posts: posts  

  render: ->
    React.DOM.div
      className: 'posts'
      React.DOM.h2
        className: 'title'
        'Posts'
    React.DOM.div
      className: 'posts'
      React.DOM.h2
        className: 'title'
        'Posts'
      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'ID'
            React.DOM.th null, 'Platform'
        React.DOM.tbody null,
          for post in @state.posts
            React.createElement Post, key: post.id, post: post, handleDeletePost: @deletePost
       