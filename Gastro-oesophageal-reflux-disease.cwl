cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  gastrooesophageal-reflux-disease---primary:
    run: gastrooesophageal-reflux-disease---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  gastrooesophageal---primary:
    run: gastrooesophageal---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: gastrooesophageal-reflux-disease---primary/output
  gastro-oesophageal-reflux-disease-operation---primary:
    run: gastro-oesophageal-reflux-disease-operation---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: gastrooesophageal---primary/output
  reflux---primary:
    run: reflux---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: gastro-oesophageal-reflux-disease-operation---primary/output
  thoracic-gastro-oesophageal-reflux-disease---primary:
    run: thoracic-gastro-oesophageal-reflux-disease---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: reflux---primary/output
  gastro-oesophageal-reflux-disease-revision---primary:
    run: gastro-oesophageal-reflux-disease-revision---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: thoracic-gastro-oesophageal-reflux-disease---primary/output
  gastroplasty-gastro-oesophageal-reflux-disease---primary:
    run: gastroplasty-gastro-oesophageal-reflux-disease---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: gastro-oesophageal-reflux-disease-revision---primary/output
  gastro-oesophageal-reflux-disease-gastropexy---primary:
    run: gastro-oesophageal-reflux-disease-gastropexy---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: gastroplasty-gastro-oesophageal-reflux-disease---primary/output
  gastro-oesophageal-reflux-disease-fundoplication---primary:
    run: gastro-oesophageal-reflux-disease-fundoplication---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: gastro-oesophageal-reflux-disease-gastropexy---primary/output
  abdominal-gastro-oesophageal-reflux-disease---primary:
    run: abdominal-gastro-oesophageal-reflux-disease---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: gastro-oesophageal-reflux-disease-fundoplication---primary/output
  gastro-oesophageal-reflux-disease-unspecified---primary:
    run: gastro-oesophageal-reflux-disease-unspecified---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: abdominal-gastro-oesophageal-reflux-disease---primary/output
  gastro-oesophageal-reflux-disease-procedure---primary:
    run: gastro-oesophageal-reflux-disease-procedure---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: gastro-oesophageal-reflux-disease-unspecified---primary/output
  gastro-oesophageal-reflux-disease-prosthesis---primary:
    run: gastro-oesophageal-reflux-disease-prosthesis---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule14
      potentialCases:
        id: potentialCases
        source: gastro-oesophageal-reflux-disease-procedure---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule15
      potentialCases:
        id: potentialCases
        source: gastro-oesophageal-reflux-disease-prosthesis---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
  inputModule14:
    id: inputModule14
    doc: Python implementation unit
    type: File
  inputModule15:
    id: inputModule15
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
