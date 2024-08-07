Pod::Spec.new do |s|
    s.name             = 'CWeb3'
    s.version          = '1.0.0'
    s.summary          = 'Web3 library for Swift. Sign transactions and interact with Smart Contracts in the Ethereum Network.'
    
    s.description      = <<-DESC
    Web3 library to sign transactions, interact with Smart Contracts, call
    Smart Contract methods and many things more, all through either a
    HTTP RPC interface provided by this library or a custom RPC interface
    (for example IPC,...).
    DESC
    
    s.homepage         = 'https://github.com/gauravcredenza3/CWeb3.git'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'CWeb3' => 'gaurav03goyal@gmail.com' }
    s.source           = { :git => 'https://github.com/gauravcredenza3/CWeb3.git', :branch => 'main' }
    
    s.ios.deployment_target = '13.0'
    
    s.swift_versions = '5.1.3', '5.1.2', '5.0', '5.1'
    
    s.pod_target_xcconfig = {
        'OTHER_SWIFT_FLAGS' => '-DWeb3CocoaPods'
    }
    
    s.default_subspecs = 'Core', 'HTTPExtension'
    
    s.subspec 'Core' do |ss|
        ss.source_files = 'Web3/Classes/Core/**/*'
        
        # Core dependencies
        ss.dependency 'BigInt', '~> 4.0'
        ss.dependency 'CryptoSwift', '~> 1.0'
        ss.dependency 'secp256k1.swift', '~> 0.1'
    end
    
    s.subspec 'HTTPExtension' do |ss|
        ss.source_files = 'Web3/Classes/FoundationHTTP/**/*'
        
        ss.dependency 'Web3/Core'
    end
    
    s.subspec 'PromiseKit' do |ss|
        ss.source_files = 'Web3/Classes/PromiseKit/**/*'
        
        ss.dependency 'Web3/Core'
        # PromiseKit dependency
        ss.dependency 'PromiseKit/CorePromise', '~> 6.0'
    end
    
    s.subspec 'ContractABI' do |ss|
        ss.source_files = 'Web3/Classes/ContractABI/**/*'
        
        ss.dependency 'Web3/Core'
    end
    
end
