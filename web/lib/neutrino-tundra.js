
module.exports = (neutrino) => {
  const port = process.env.CAPYBARA ? 5005 : 5000;
  neutrino.config.devServer.port(port);
};
