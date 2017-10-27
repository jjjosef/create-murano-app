'use strict';
const Generator = require('yeoman-generator');
const chalk = require('chalk');
const yosay = require('yosay');

module.exports = class extends Generator {
  prompting() {
    // Have Yeoman greet the user.
    this.log(
      yosay(
        'Welcome to the premium ' +
          chalk.red('generator-create-murano-app') +
          ' generator!'
      )
    );

    const prompts = [
      {
        type: 'input',
        name: 'email',
        message: 'Email'
      },
      {
        type: 'input',
        name: 'password',
        message: 'Password'
      }
    ];

    return this.prompt(prompts).then(props => {
      // To access props later use this.props.someAnswer;
      this.props = props;
    });
  }

  writing() {
    this.fs.copyTpl(
      this.templatePath('.murano/config'),
      this.destinationPath('.murano/config'),
      this.props
    );

    this.fs.copyTpl(
      this.templatePath('.murano/passwords'),
      this.destinationPath('.murano/passwords'),
      this.props
    );
  }

  install() {
    // This.installDependencies();
  }
};
