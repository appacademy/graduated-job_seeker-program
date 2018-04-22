import merge from 'lodash/merge';

import {
  RECEIVE_BENCH,
  RECEIVE_REVIEW,
} from '../actions/bench_actions';

const reviewsReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_BENCH:
      return merge({}, state, action.reviews);
    case RECEIVE_REVIEW:
      const { review } = action;
      return merge({}, state, { [review.id]: review });
    default:
      return state;
  }
}

export default reviewsReducer;
