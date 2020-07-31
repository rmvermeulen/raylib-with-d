import std.stdio;
import raylib;

/// nothing yet
class GameObject
{
	/// world position
	Vector2 position;
	/// called at the appropriate time
	void onDraw()
	{
	}
}

/// Simple label
class Label : GameObject
{
	/// What the label displays
	string text = "This is a label";
	override void onDraw()
	{
		DrawText(text.ptr, pos.x, pos.y, 28, BLACK);
	}
}

void main()
{
	GameObject[] entities = [
		new Label(Vector2(400, 300), "This is a label")
	];

	InitWindow(800, 600, "Hello, Raylib-D!");
	while (!WindowShouldClose())
	{
		BeginDrawing();
		ClearBackground(RAYWHITE);
		foreach (entity; entities)
		{
			entity.onDraw();
		}
		EndDrawing();
	}
	CloseWindow();
}
