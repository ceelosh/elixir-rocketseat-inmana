defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special, returns a special message" do
      params = %{"name"=> "banana", "age"=> "42"}

      result = Welcomer.welcome(params)
      expected_result = {:ok, "You are very special."}
      assert result == expected_result
    end

    test "when the user is under age, returns an error" do
      params = %{"name"=> "marcelo", "age"=> "17"}
      expected_result = {:error, "You shall not pass marcelo"}

      result = Welcomer.welcome(params)
      assert result == expected_result
    end
  end

end
