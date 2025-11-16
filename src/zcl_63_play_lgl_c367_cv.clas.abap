CLASS zcl_63_play_lgl_c367_cv DEFINITION ABSTRACT
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
  PROTECTED SECTION.

    DATA: players_counter TYPE i.

    METHODS: initialize_game ABSTRACT.
    METHODS: create_game ABSTRACT IMPORTING iv_player TYPE i.
    METHODS: end_game ABSTRACT RETURNING VALUE(rv_finalized) TYPE abap_bool.
    METHODS: print_winner ABSTRACT.

    METHODS: play FINAL IMPORTING iv_players TYPE i.

  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_63_PLAY_LGL_C367_CV IMPLEMENTATION.


  METHOD play.

    DATA: lv_player TYPE i.
    CLEAR me->players_counter.

    me->players_counter = iv_players.
    me->initialize_game(  ).

    WHILE me->end_game(  ) NE abap_false.
      me->create_game( lv_player ).
      lv_player += 1.
    ENDWHILE.

  ENDMETHOD.
ENDCLASS.
