Vim�UnDo� nO!m6�9�gj����i�G7��˓   +                                   _,�=    _�                             ����                                                                                                                                                                                                                                                                                                                                                             _,�     �              5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             _,�     �      .       �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             _,�     �                  5�_�                    -        ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          =// The module 'vscode' contains the VS Code extensibility API5�_�                    -        ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          N// Import the module and reference it with the alias vscode in your code below5�_�                    -        ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          !import * as vscode from 'vscode';5�_�                    -        ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -           5�_�      	              -        ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          9// this method is called when your extension is activated5�_�      
           	   -        ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          J// your extension is activated the very first time the command is executed5�_�   	              
   -        ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          <export function activate(context: vscode.ExtensionContext) {5�_�   
                 -        ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -           5�_�                    -       ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          ]	// Use the console to output diagnostic information (console.log) and errors (console.error)5�_�                    -       ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          Q	// This line of code will only be executed once when your extension is activated5�_�                    -       ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          R	console.log('Congratulations, your extension "tse-daily-report" is now active!');5�_�                    -        ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -           5�_�                    -       ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          9	// The command has been defined in the package.json file5�_�                    -       ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          F	// Now provide the implementation of the command with registerCommand5�_�                    -       ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          H	// The commandId parameter must match the command field in package.json5�_�                    -       ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          X	let disposable = vscode.commands.registerCommand('tse-daily-report.helloWorld', () => {5�_�                    -       ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          Q		// The code you place here will be executed every time your command is executed5�_�                    -        ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -           5�_�                    -       ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          &		// Display a message box to the user5�_�                    -       ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          M		vscode.window.showInformationMessage('Hello World from TSE Daily Report!');5�_�                    -       ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          	});5�_�                    -        ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -           5�_�                    -       ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          (	context.subscriptions.push(disposable);5�_�                    -        ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          }5�_�                    -        ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -           5�_�                    -        ����                                                                                                                                                                                                                                                                                                                                                             _,�     �   ,   -          ;// this method is called when your extension is deactivated5�_�                    -        ����                                                                                                                                                                                                                                                                                                                                                             _,�    �   ,   -          export function deactivate() {}5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             _,�<     �               ,   =// The module 'vscode' contains the VS Code extensibility API   N// Import the module and reference it with the alias vscode in your code below   !import * as vscode from 'vscode';   /import * as child_process from 'child_process';       9// this method is called when your extension is activated   J// your extension is activated the very first time the command is executed   <export function activate(context: vscode.ExtensionContext) {       ^  // Use the console to output diagnostic information (console.log) and errors (console.error)   R  // This line of code will only be executed once when your extension is activated   N  console.log('Congratulations, your extension "hello-world" is now active!');   :  // The command has been defined in the package.json file   G  // Now provide the implementation of the command with registerCommand   I  // The commandId parameter must match the command field in package.json   T  let disposable = vscode.commands.registerCommand('hello-world.helloWorld', () => {   F    let editor = vscode.window.activeTextEditor; // エディタ取得       if(editor) {   G      let doc = editor.document;            // ドキュメント取得   A      let cur_selection = editor.selection; // 選択範囲取得   ,      if(editor.selection.isEmpty){            E      // 選択範囲が空であれば全てを選択範囲にする   1        let startPos = new vscode.Position(0, 0);   C        let endPos = new vscode.Position(doc.lineCount - 1, 10000);   ?        cur_selection = new vscode.Selection(startPos, endPos);         }       J      let body = doc.getText(cur_selection); //取得されたテキスト   U      // The code you place here will be executed every time your command is executed         let address = '~@co.jp';         let subject = '件名';   *      require("openurl").mailto([address],   *        { subject: subject, body: body });   1      vscode.window.showInformationMessage(body);       }   (    // Display a message box to the user            });       )  context.subscriptions.push(disposable);   }       ;// this method is called when your extension is deactivated   export function deactivate() {}5��