import std.stdio;
import std.algorithm : sort;
import std.conv : text;
import raylib;

import nodes : Node, Label, Sprite;
import std.typecons : Typedef;

void main()
{

	Node[] nodes = [
		// new Node(Vector2(10, 10)),
		new Label("Some label"), new Label(Vector2(80, 130), "Another label"),
		// new Sprite(Vector2(50, 50), "./sprites/tileSand1.png"),
	];

	auto tex = LoadTexture("./sprites/tileSand1.png");
	// writeln("texture: ", tex);

	InitWindow(800, 600, "My awesome game");
	while (!WindowShouldClose())
	{
		if (IsWindowMinimized())
		{
			continue;
		}
		if (IsWindowResized())
		{
			writeln("window resized: ", GetScreenWidth(), "x", GetScreenHeight());
		}
		auto delta = GetFrameTime();
		foreach (ref node; nodes)
		{
			node.update(delta);
		}
		// nodes.sort((a, b) => a.depth < b.depth);

		BeginDrawing();
		ClearBackground(RAYWHITE);
		// Transform current_transform;
		foreach (ref node; nodes)
		{
			node.draw();
		}
		EndDrawing();
	}
	CloseWindow();
}
