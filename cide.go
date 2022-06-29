// Copyright 2015 The gocui Authors. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"os"

	"github.com/jroimartin/gocui"
)

//define global var "content"
var content []byte

func main() {

	//add paramters to the command line: filename
	filename := os.Args[1]
	//read file if not exists create it
	if _, err := os.Stat(filename); os.IsNotExist(err) {
		fmt.Println("File not exists, creating it")
		if err := ioutil.WriteFile(filename, []byte(""), 0644); err != nil {
			log.Fatal(err)
		}
	}
	file, err := os.Open(filename)
	if err != nil {
		log.Fatal(err)
	}
	//get content
	//set puglic var "content" to file content
	content, err = ioutil.ReadAll(file)
	if err != nil {
		log.Fatal(err)
	}
	//close file
	file.Close()

	g, err := gocui.NewGui(gocui.OutputNormal)
	if err != nil {
		log.Fatalln(err)
	}
	defer g.Close()

	g.Cursor = true

	g.SetManagerFunc(layout)

	if err := initKeybindings(g); err != nil {
		log.Fatalln(err)
	}

	if err := g.MainLoop(); err != nil && err != gocui.ErrQuit {
		log.Fatalln(err)
	}
}

func layout(g *gocui.Gui) error {
	maxX, maxY := g.Size()
	if v, err := g.SetView("help", maxX-23, 0, maxX-1, 4); err != nil {
		if err != gocui.ErrUnknownView {
			return err
		}
		v.Title = "Keybindings"
		fmt.Fprintln(v, "^a: Set mask")
		fmt.Fprintln(v, "^s: Safe")
		fmt.Fprintln(v, "^c: Exit")

	}

	if v, err := g.SetView("input", 0, 0, maxX-24, maxY-1); err != nil {
		if err != gocui.ErrUnknownView {
			return err
		}
		if _, err := g.SetCurrentView("input"); err != nil {
			return err
		}
		v.Title = "CIDE -- Editing: " + os.Args[1]
		//write content to the input view
		fmt.Fprintf(v, "%s", content)
		v.Editable = true
		v.Wrap = true
	}
	return nil
}

func initKeybindings(g *gocui.Gui) error {
	if err := g.SetKeybinding("", gocui.KeyCtrlC, gocui.ModNone,
		func(g *gocui.Gui, v *gocui.View) error {
			return gocui.ErrQuit
		}); err != nil {
		return err
	}
	if err := g.SetKeybinding("input", gocui.KeyCtrlA, gocui.ModNone,
		func(g *gocui.Gui, v *gocui.View) error {
			v.Mask ^= '*'
			return nil
		}); err != nil {
		return err
	}
	if err := g.SetKeybinding("", gocui.KeyCtrlS, gocui.ModNone,
		func(g *gocui.Gui, v *gocui.View) error {
			//save content to file
			file, err := os.Create(os.Args[1])
			if err != nil {
				log.Fatal(err)
			}
			//write content to file
			_, err = file.Write([]byte(v.Buffer()))
			if err != nil {
				log.Fatal(err)
			}
			//close file
			file.Close()
			return nil
		}); err != nil {
		return err
	}
	return nil
}
