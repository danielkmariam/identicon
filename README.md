# Identicon

**TODO: **
- Take a text and change it to hex
- Change hex to a list
- Create a struct to hold image data and pass it to different functions
- Take the first three elements of the list as the colour for the image, RGB
- Create three element lists from the list
- Change each three element lists to five element by mirroring the first, and second to the last and forth
  [1,2,3] > [1,2,3,2,1]



## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `identicon` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:identicon, "~> 0.1.0"}]
    end
    ```

  2. Ensure `identicon` is started before your application:

    ```elixir
    def application do
      [applications: [:identicon]]
    end
    ```
