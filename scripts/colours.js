#!/usr/bin/env node

function colourCode(colourName, options = {}) {
    const fgOffset = 30;
    const bgOffset = 40;
    const colourNames = ["black", "red", "green", "yellow", "blue", "purple", "cyan", "gray"];
    const colourCode = colourNames.indexOf(colourName);
    if (colourCode == -1) throw `Use one of: ${colourNames.join(' ')}`;
    const prefix = options.bright ? 1 : options.under ? 4 : 0;
    const offset = options.background ? bgOffset : fgOffset;

    let colourString = "\033[" + [prefix, colourCode + offset].join(';') + 'm';

    return options.ps1 ? `\\[${colourString}\\]` : colourString
}

if (process.argv.length < 3) throw `Usage: ${argv[1]} COLOUR [options]`;
const colour = process.argv[2];
const args = process.argv.slice(3);
process.stdout.write(colourCode(colour, args.reduce((acc, item) => {
    let option = { h: 'bright', b: 'background', p: 'ps1' }[item];
    if (option == null) throw `Invalid option ${item}`;
    acc[option] = true;
    return acc
}, {})))