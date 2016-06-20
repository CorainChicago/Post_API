@Posts = React.createClass

  getInitialState: ->
        posts: @props.data

  getDefaultProps: ->
        posts: []

  deletePost: (post) ->
    index = @state.posts.indexOf post
    posts = React.addons.update(@state.posts, { $splice: [[index, 1]] })
    console.log(post.id)
    @replaceState posts: posts 

  updatePosts: (posts) ->
    this.setState(this.getInitialState());

  handleUpdate: -> 
    $.ajax
      url: 'posts/update_database'
      dataType: 'json'
      cache: false
      success: ((data) ->
        this.updatePosts data
      ).bind(this)
      error: ((xhr, status, err) ->
        console.error @props.url, status, err.toString()
        return
      ).bind(this)      

  render: ->
    React.DOM.div
      className: 'posts'
      React.DOM.h2
        className: 'title'
        'API Posts'
      React.DOM.a
        className: 'button'
        onClick: @handleUpdate
        'Update'

      React.DOM.table
        className: 'table table-bordered'
        React.DOM.thead null,
          React.DOM.tr null,
            React.DOM.th null, 'ID'
            React.DOM.th null, 'Platform'
            React.DOM.th null, 'Date'
        React.DOM.tbody null,
          for post in @state.posts
            React.createElement Post, key: post.id, post: post, handleDeletePost: @deletePost, handleUpdate: @updatePosts
       