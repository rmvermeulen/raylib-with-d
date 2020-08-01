module nodes;
import std.stdio;
import raylib;

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

class Sprite : Node
{
    private Texture2D texture;
    private string path;
    this(string a_path)
    {
        this(Vector2(), a_path);
    }

    this(Vector2 a_pos, string a_path)
    {
        super(a_pos);
        path = a_path;
        texture = LoadTexture(path.ptr);
        writeln("texture: ", texture);
    }

    override void draw()
    {
        DrawTexture(texture, cast(int) position.x, cast(int) position.y, RAYWHITE);
    }
}

class Label : Node
{
    string text;
    this(string a_text)
    {
        this(Vector2(), a_text);
    }

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
