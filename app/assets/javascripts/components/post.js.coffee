@Post = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    $.ajax
      method: 'DELETE'
      url: "/posts/#{ @props.post.id }"
      dataType: 'JSON'
      success: () =>
        @props.handleDeletePost @props.post
  render: ->
    React.DOM.tr null,
      React.DOM.td null, @props.post.crowd_tangle_id
      React.DOM.td null, @props.post.platform
      React.DOM.td null,
        React.DOM.a
          className: 'delete'
          onClick: @handleDelete
          'Delete'