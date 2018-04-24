export const selectBench = ({ benches, reviews }, id) => {
  if (benches[id]) {
    const bench = benches[id];
    bench.reviews = bench.reviewIds.map(id => reviews[id]);
    return bench;
  }
  return {};
};
export const asArray = ({ benches }) => (
  Object.keys(benches).map(key => benches[key])
);
