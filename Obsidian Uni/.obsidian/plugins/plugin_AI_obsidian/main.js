import { App, Plugin, PluginSettingTab, Setting } from 'obsidian';

export default class MyPlugin extends Plugin {
  async onload() {
    console.log('loading plugin');

    this.addCommand({
      id: 'open-input-window',
      name: 'Open Input Window',
      callback: () => {
        new InputWindow(this.app).open();
      },
    });
  }
}

class InputWindow {
  constructor(app) {
    this.app = app;
  }

  open() {
    const modal = this.app.createModal();
    modal.setContent(`
      <div class="input-window">
        <h2>Input Window</h2>
        <input type="text" id="input-field" placeholder="Enter text here">
        <button id="submit-button">Submit</button>
      </div>
    `);

    const inputField = modal.el.querySelector('#input-field');
    const submitButton = modal.el.querySelector('#submit-button');

    submitButton.addEventListener('click', () => {
      const inputText = inputField.value;
      console.log(`Input text: ${inputText}`);
      modal.close();
    });

    modal.open();
  }
}

class MyPluginSettingTab extends PluginSettingTab {
  display() {
    let { containerEl } = this;

    containerEl.empty();

    containerEl.createEl('h2', { text: 'Plugin Settings' });

    new Setting(containerEl)
      .setName('Setting Name')
      .setDesc('Setting description.')
      .addText((text) =>
        text
          .setPlaceholder('Text input')
          .setValue('')
          .onChange((value) => {
            console.log(`New value: ${value}`);
          })
      );
  }
}