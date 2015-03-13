require 'spec_helper'
require 'key_master'

describe CocoaPodsKeys::KeyMaster do
  let(:empty_keys_interface) {
    <<-KEYS_H
//
// Generated by CocoaPods-Keys
// on 11/03/2015
// For more information see https://github.com/cocoapods/cocoapods-keys
//

#import <Foundation/NSString.h>

@interface FakeKeys : NSObject


@end
KEYS_H
  }
  
  it "should init with an empty keyring" do
    keyring = double("Keyring", keychain_data: [], code_name: "Fake")
    keymaster = described_class.new(keyring, Time.new(2015, 3, 11))
    expect(keymaster.name).to eq("FakeKeys")
    expect(keymaster.interface).to eq(empty_keys_interface)
  end
end