import std.stdio;
import std.algorithm : sort;
import raylib;

import std.typecons : Typedef;

/// base node
class Node
{
	int depth = 0;
	Vector2 position;
	this(Vector2 a_pos)
	{
		position = a_pos;
	}

	void update(float delta)
	{
	}

	void draw()
	{
	}
}

class Label : Node
{
	string text;
	this(Vector2 a_pos, string a_text)
	{
		super(a_pos);
		text = a_text;
	}

	override void draw()
	{
		DrawText(text.ptr, cast(int) position.x, cast(int) position.y, 32, BLACK);
	}

	override void update(float delta)
	{

	}
}

void main()
{
	Node[] nodes = [
		new Node(Vector2(10, 10)), new Label(Vector2(100, 100), "Some label"),
		new Label(Vector2(80, 100), "Another label")
	];

	InitWindow(800, 600, "My awesome game");
	while (!WindowShouldClose())
	{
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
