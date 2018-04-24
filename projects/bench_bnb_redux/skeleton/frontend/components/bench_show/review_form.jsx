import React from 'react';
import { withRouter } from 'react-router-dom';

class ReviewForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      rating: 5,
      body: ''
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.navigateToBenchShow = this.navigateToBenchShow.bind(this);
  }

  navigateToBenchShow() {
    const url = `/benches/${this.props.match.params.benchId}`
    this.props.history.push(url);
  }

  handleSubmit(e) {
    e.preventDefault();
    const benchId = parseInt(this.props.match.params.benchId);
    const review = Object.assign({}, this.state, {
      bench_id: benchId
    });
    this.props.createReview(review);
    this.navigateToBenchShow();
  }

  update(property) {
    return e => this.setState({ [property]: e.currentTarget.value });
  }

  render() {
    return (
      <div className="review-form">
        <form onSubmit={this.handleSubmit}>
          <label>Rating</label>
          <br/>
          <input
            type="number"
            value={this.state.rating}
            onChange={this.update("rating")}
          />
          <br/>

          <label>Comment</label>
          <br/>

          <textarea
            cols="30"
            rows="10"
            value={this.state.body}
            onChange={this.update("body")}
          />
          <br/>
          <input type="submit" />
        </form>
        <button onClick={this.navigateToBenchShow}>Cancel</button>
      </div>
    );
 }
}

export default withRouter(ReviewForm);
