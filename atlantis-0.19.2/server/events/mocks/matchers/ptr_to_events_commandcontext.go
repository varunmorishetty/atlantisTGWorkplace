// Code generated by pegomock. DO NOT EDIT.
package matchers

import (
	"github.com/petergtz/pegomock"
	"reflect"

	events "github.com/runatlantis/atlantis/server/events"
)

func AnyPtrToEventsCommandContext() *events.CommandContext {
	pegomock.RegisterMatcher(pegomock.NewAnyMatcher(reflect.TypeOf((*(*events.CommandContext))(nil)).Elem()))
	var nullValue *events.CommandContext
	return nullValue
}

func EqPtrToEventsCommandContext(value *events.CommandContext) *events.CommandContext {
	pegomock.RegisterMatcher(&pegomock.EqMatcher{Value: value})
	var nullValue *events.CommandContext
	return nullValue
}

func NotEqPtrToEventsCommandContext(value *events.CommandContext) *events.CommandContext {
	pegomock.RegisterMatcher(&pegomock.NotEqMatcher{Value: value})
	var nullValue *events.CommandContext
	return nullValue
}

func PtrToEventsCommandContextThat(matcher pegomock.ArgumentMatcher) *events.CommandContext {
	pegomock.RegisterMatcher(matcher)
	var nullValue *events.CommandContext
	return nullValue
}
