; This rule is for "She wants to sing."  I hate these rules, which were here when I got here.
; There are five of them. There could be fifty.  There would need to be, to cover all cases.  Somebody
; randomly chose five sentence-types to enshrine in these rules.  See my comment in the old relex2logic
; rule-file for more of an explanation of the problem.
; (AN June 2015)

(define todo5
    (BindLink
        (VariableList
            (TypedVariableLink
                (VariableNode "$a-parse")
                (TypeNode "ParseNode")
            )
            (TypedVariableLink
                (VariableNode "$subj")
                (TypeNode "WordInstanceNode")
            )
	    (TypedVariableLink
                (VariableNode "$subj2")
                (TypeNode "WordInstanceNode")
            )
            (TypedVariableLink
                (VariableNode "$verb1")
                (TypeNode "WordInstanceNode")
            )
            (TypedVariableLink
                (VariableNode "$verb2")
                (TypeNode "WordInstanceNode")
            )
	    (TypedVariableLink
                (VariableNode "$obj")
                (TypeNode "WordInstanceNode")
            )
        )
        (AndLink
            (WordInstanceLink
                (VariableNode "$subj")
                (VariableNode "$a-parse")
            )
            (WordInstanceLink
                (VariableNode "$verb1")
                (VariableNode "$a-parse")
            )
            (WordInstanceLink
                (VariableNode "$verb2")
                (VariableNode "$a-parse")
            )
            (EvaluationLink
                (DefinedLinguisticRelationshipNode "_subj")
                (ListLink
                    (VariableNode "$verb1")
                    (VariableNode "$subj")
                )
            )
	    (AbsentLink
		    (EvaluationLink
        	        (DefinedLinguisticRelationshipNode "_subj")
        	        (ListLink
        	            (VariableNode "$verb2")
        	            (VariableNode "$subj2")
        	        )
        	    )
	    )
            (AbsentLink
		    (EvaluationLink
        	        (DefinedLinguisticRelationshipNode "_obj")
        	        (ListLink
        	            (VariableNode "$verb2")
        	            (VariableNode "$obj")
        	        )
        	    )
	    )
            (EvaluationLink
                (DefinedLinguisticRelationshipNode "_to-do")
                (ListLink
                    (VariableNode "$verb1")
                    (VariableNode "$verb2")
                )
            )
	)
       (ListLink
        (ExecutionOutputLink
            (GroundedSchemaNode "scm: pre-todo5-rule")
            (ListLink
                (VariableNode "$subj")
                (VariableNode "$verb1")
                (VariableNode "$verb2")
            )
        )
       )
    )
)

; This is function is not needed. It is added so as not to break the existing
; r2l pipeline.
(define (pre-todo5-rule subj verb1 verb2)
 (ListLink
  (to-do-rule-5 
	(word-inst-get-word-str verb1) (cog-name verb1)
	(word-inst-get-word-str verb2) (cog-name verb2)
	(word-inst-get-word-str subj) (cog-name subj)
  )
 )
)
