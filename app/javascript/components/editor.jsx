import React, { Component } from "react";
import axios from "axios";
import jquery from "jquery";
import "../stylesheets/editor.css";

class Editor extends Component {
  state = {
    title: null,
    content: null,
    runtime: 0,
    postId: 0
  };

  titleStyle = {
    cursor: "pointer"
  };

  render() {
    return (
      <div className="container">
        <div className="row">
          <div className="col">
            <div className="col text-center  text-center">
              <a className="display-4 app-header" href="/">
                Blog App
              </a>
            </div>
            <p className="lead text-center ">Your Own Journal</p>
            <div className="text-right">
              <a
                className="lead"
                rel="nofollow"
                data-method="delete"
                href="/users/sign_out"
              >
                logout
              </a>
            </div>

            <textarea
              onKeyUp={this.updateTitle}
              className="col mx-auto text-center app-header display-4 mt-5 border-0 blog-title"
              placeholder="Write down a title"
            />
            <p className="lead text-right">
              <button className="btn btn-info m-2" onClick={this.save}>
                save
              </button>
              <button className="btn btn-danger" onClick={this.publish}>
                publish
              </button>
            </p>
            <textarea
              className="col mx-auto text-left border-0 blog-content lead"
              onKeyUp={this.updateContent}
              placeholder="Write your content"
            />
          </div>
        </div>
      </div>
    );
  }

  updateTitle = e => {
    this.setState({ title: e.target.value });
  };
  updateContent = e => {
    this.setState({ content: e.target.value });
  };

  save = () => {
    console.log(this.state.title);
    console.log(this.state.content);
    let currentState = this;
    console.log(currentState.state);
    currentState.state.runtime === 0
      ? jquery.ajax({
          type: "POST",
          url: "/posts",
          data: {
            post: {
              title: currentState.state.title,
              content: currentState.state.content
            }
          },
          success: data => {
            console.log(data);
            currentState.setState(
              { postId: data.id, runtime: currentState.state.runtime + 1 },
              () => {
                console.log(currentState.state);
              }
            );
          },
          dataType: JSON.stringify()
        })
      : jquery.ajax({
          type: "PUT",
          url: "/posts/" + currentState.state.postId,
          data: {
            post: {
              title: currentState.state.title,
              content: currentState.state.content
            }
          },
          success: data => {
            console.log(data);
          },
          dataType: JSON.stringify()
        });
  };
  //   : axios
  //       .put("/posts", {
  //         title: currentState.state.title,
  //         content: currentState.state.content
  //       })
  //       .then(function(response) {
  //         console.log(response);
  //       })
  //       .catch(function(error) {
  //         console.log(error);
  //       });
  //};
  publish = () => {
    let currentState = this;
    axios
      .post("/posts", {
        title: currentState.state.title,
        content: currentState.state.content,
        is_published: true
      })
      .then(function(response) {
        console.log(response);
      })
      .catch(function(error) {
        console.log(error);
      });
  };

  backToHome = () => {
    console.log("going to home");
    window.location.href = "/";
  };
}

export default Editor;
