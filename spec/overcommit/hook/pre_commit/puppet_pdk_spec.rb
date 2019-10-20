# frozen_string_literal: true

require 'spec_helper'

describe Overcommit::Hook::PreCommit::PuppetPdk do
  let(:config)  { Overcommit::ConfigurationLoader.default_configuration }
  let(:context) { double('context') }
  subject { described_class.new(config, context) }

  before do
    subject.stub(:applicable_files).and_return(%w[file1.pp file2.pp])
  end

  context 'when pdk exits successfully' do
    let(:result) { double('result') }
    before do
      result.stub(:success?).and_return(true)
      subject.stub(:execute).and_return(result)
    end
    context 'with no output' do
      before do
        result.stub(:stdout).and_return('')
      end
      it { should pass }
    end
  end
end
