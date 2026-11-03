Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690518;
	b=gqcE20DSbGrgD9IiMX0bnX0xoTIZ83/qa/4LF33yFi3SP/rrnbTSF484DadLlTfaNFTD
	 gKIf0c10m4W0i3TP5+lUqcWP5FYckCtAyuS6b/lPwptiNYK64RDrYK1+QWgEApAveakiP
	 aJZ+K4a1uyfssSdnIH+m7k9ONZQQfJG/sxaWIgKeKaqvILaMt3P+wh6MolRvkvXksaEhy
	 S4yAYxgaXud0BKVx/CcFwPBTnBfzZYV2SPH5ysDtEibK1jfvt/UnYHaZgVKYVktXfqPLT
	 vc+/9ZUEq+ZBM32fOVZPqdECEYL6Jx6ROczhFgDemLBz4hYshYa31MK//6eiNNyAIMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690518;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:From:Subject:Content-Type:Content-Transfer-Encoding;
	bh=mgdgkD5bfLPRWsey/eQyLeLRVW9sxJsb6Jy7oprYHjc=;
	b=MaRWBqV4HLxVJIkJUWgr0npGEnFDmOWt7y5s0DQtjtU41/hJw6Kj0Yw4zB7y5Rw+/RBr
	 MQs85IvvvIOYjhwZmjjPWr/eq2LtwlY3WK3z3RGwVmn1d83eYyNX7cohROQP3mEMzHTkd
	 Zeg3UWZzA06qLqrUlA/NHW77VHKLPJyKSECS+UpXqsIk4iaL6ISXh+/T6jlL/RqO/UB1u
	 0piG0hI1BlWH01IPtROOCd51SCoz0aZxRvJm4czQ5O0bby609LIEOr/DZjtAOiy6715Ws
	 0KTSdrw/VtovG3I1Qe3Q3x0r7y9ZCmrzIg276Cj8dtfD5aSs7rATy6HJlPQne8dIcGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.201
Received: from mta0.migadu.com (out-201.mta0.migadu.com [91.218.175.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63404606A324
	for <sophgo@lists.linux.dev>; Tue,  3 Nov 2026 07:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63404606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: sophgo@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=rSkbbVN2hzRIwD0U7ZJZJMDJ+E6mFgQa0gOOGWdPink=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793690512; v=1; x=1794295312;
 b=OTKjM9LIMfPN4Oqy3LOMGfFkKPYkSwLSvwQhhtthbXsupFACAs/Y/NbdoQBwb774h1Tgx6tI
 x4DgqXpa8ljCFastNNna+clnlTaAftPZyvbPWDVr0qeJiXXkzMceNN6lmCL8ECZapvTBcz1Dkdx
 x4NfFoURkI1RgWCMv14EEXvM=
X-Envelope-To: sophgo@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 7a1b40a4a7ca7ad4;
	Tue, 03 Nov 2026 07:21:52 +0000
X-Mizu-Trace-ID: 7a1b40a4a7ca7ad4
X-Migadu-Flow: FLOW_OUT
Message-ID: <cddb29f6-fa77-4c3a-94da-1a41dc58df0d@linux.dev>
Date: Tue, 3 Nov 2026 15:21:44 +0800
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
Cc: =?UTF-8?B?6ZmI6KKB5byY?= <djmolq@gmail.com>,
 Hiago De Franco <hfranco@baylibre.com>
From: Chen Wang <chen.wang@linux.dev>
Subject: Linux Upstream Status updated: Nov/3/2026
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Linux Upstream Status updated: Nov/3/2026  
@https://github.com/sophgo/linux/wiki

v7.4-rc1 has been released, which incldues PRs for Sophgo Devicetrees.

About PRs for v7.4, see 
<https://lore.kernel.org/sophgo/aff6ff25-8969-4a35-9543-9113afb2e003@linux.dev/>. 


Other new activites:

CV18xx:
- Yuxuan Zeng <djmolq@gmail.com> would like to take over efuse driver 
development, thank you Yuxuan Zeng.
- Hiago De Franco <hfranco@baylibre.com> would like to take over PWM 
driver development, thank you Hiago.

SG2042:
- N/A

SG2044:
- eFuse driver: v1 submitted, in reviewing.

Thanks,

Chen



