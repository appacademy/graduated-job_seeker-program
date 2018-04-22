import { connect } from 'react-redux';

import { createReview } from '../../actions/bench_actions.js';
import ReviewForm from './review_form';

const mapDispatchToProps = dispatch => ({
  createReview: review => dispatch(createReview(review))
});

export default connect(
  null,
  mapDispatchToProps
)(ReviewForm);
