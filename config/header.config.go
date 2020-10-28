package config

type HeaderConfig struct {
	Headers       []Header       `yaml:"headers"`
	ParsingStates []ParsingState `yaml:"parsingStates"`
	Deparser      []string       `yaml:"deparser"`
	Metadata      []Metadata     `yaml:"metadata"`
}
type Field struct {
	Name     string `yaml:"name"`
	Bitwidth string `yaml:"bitwidth"`
}
type Header struct {
	Type       string   `yaml:"type"`
	HeaderType string   `yaml:"headerType"`
	Fields     []Field  `yaml:"fields"`
	Statements []string `yaml:"statements"`
}
type Default struct {
	Name string `yaml:"name"`
}
type NextState struct {
	Name        string `yaml:"name"`
	OnValue     string `yaml:"onValue"`
	OnValueType string `yaml:"onValueType"`
	Constant    bool   `yaml:"constant"`
}
type ParsingState struct {
	Name       string       `yaml:"name"`
	Extract    string       `yaml:"extract"`
	OnHeader   string       `yaml:"onHeader"`
	OnField    string       `yaml:"onField"`
	Transition string       `yaml:"transition"`
	Default    Default      `yaml:"default"`
	NextStates []NextState  `yaml:"nextStates,omitempty"`
}

type Metadata struct {
	Type       string       `yaml:"type"`
	MetaType   string       `yaml:"metaType"`
	Fields     []Field      `yaml:"fields"`
	Statements []string     `yaml:"statements"`
}