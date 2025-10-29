Received: from insect.birch.relay.mailchannels.net (insect.birch.relay.mailchannels.net [23.83.209.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D052D29A9
	for <sophgo@lists.linux.dev>; Wed, 29 Oct 2025 14:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761749450; cv=pass; b=U5dXG1/zddCIqz6RfKUtFU6FQKOyRep7X6fuqZUSNNX1esXfvk8Sjf+ebl9mnV4PRM/7DGoqD4BjRy1LFODgW9ZqPeEeNsF93cvIkOviqMxCOMRmCftJCS/2IczqlXXt1n73AbPay5HIDqq4bDUUn7WKmh6BXUA6J9dFPmtfAMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761749450; c=relaxed/simple;
	bh=BUgAW49e2nve4OrDnsZ3F5c2FdN5r+KeTRc5FJ8iWTM=;
	h=Message-ID:MIME-Version:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:Date; b=PMOLdBJUXdKd/it8yYJLyyncjWOJV5aFF+lmjvzldKg7V/apT1Vp99IrgzyWNPm6j5q3hLLa2cbNXRkHgJYIRfyTVaDN4TJL/a6k7sqi0g11th0Q0oT/f6ZEtj1f87igW1G06lxx3F7aC7pMF7IeUz/CjTVHbhQawHbPepS8FdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com; spf=pass smtp.mailfrom=rootcommit.com; dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b=aTHNEf/T; arc=pass smtp.client-ip=23.83.209.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rootcommit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rootcommit.com header.i=@rootcommit.com header.b="aTHNEf/T"
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id CD544721631;
	Wed, 29 Oct 2025 14:41:49 +0000 (UTC)
Received: from fr-int-smtpout24.hostinger.io (trex-green-8.trex.outbound.svc.cluster.local [100.123.122.56])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id B43DD721840;
	Wed, 29 Oct 2025 14:41:44 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761748909; a=rsa-sha256;
	cv=none;
	b=i3WSzsLYo7teMpHtZN0AjNdZ4foxz/q0PwZGvGzYNAIojH4EsbGQ17K8774xGyd6mxTMLB
	AIFpEh/IpG6S27BBxOBmbMKyRkp0I+RTMkqY9VNnJmGjAp/5zhmQSBIZ9ik8ZmdyxDfV9Y
	CtoZTo531IguB7U3eMa+JvTOGrgOw5o1T8HKs4qiYSdjIzMLp49EKnCnj2XlxlxJhXl6do
	UTgcHe4K0jjWChiat2QCh3vY/If2abb5ELbVYOrPljt73WetzLmien5MinVYd8jlcfxXK9
	JzsdRypXg1FcWEly0Ooy8DLhFjhrL9z6fMsBuo6Q5q0ppMrMnUTDAHBzGlNXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761748909;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=S1xXs3JGvgEgRE8/1iINIBl8/G8ZW5nPLsCFO5WNNV0=;
	b=Imoa1XqZLGBRzJTPpZvMEnuo8HAAAUTw7rSu0RE6UGjbbYihjRQmrK+8e2MYrOuoBADE7b
	CuJT06i83I8m6y86e2viB2TJxjZjs7wqrJixsuEj7/qwyycE/3eC/YpWhwae1WeRGqjHLT
	RfaN50i7GBxmaOFuBUSJp385MIVpyCXG1GuDgtyg/AkunqUdWRxp0eTgvt/YOBYnP3rKJf
	8fj2MFxLZNRLwM02rXkruzCCteryjWobWwkw8/0IfESu5fWEGmpN6COzIlqxXMfPLWPd5z
	aIDYo50nQ/8sItNpH4GIGPp/TkxGe7twl2s2HW1UUfsJgquGeLTb5D0M6k+q0w==
ARC-Authentication-Results: i=1;
	rspamd-77bb85d8d5-wq79s;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Hysterical-Tart: 443c3104291b6376_1761748909567_1523129841
X-MC-Loop-Signature: 1761748909567:1662878829
X-MC-Ingress-Time: 1761748909567
Received: from fr-int-smtpout24.hostinger.io (fr-int-smtpout24.hostinger.io
 [148.222.54.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.123.122.56 (trex/7.1.3);
	Wed, 29 Oct 2025 14:41:49 +0000
Received: from [IPV6:2001:861:4450:d360:cc54:3014:8454:2c6d] (unknown [IPv6:2001:861:4450:d360:cc54:3014:8454:2c6d])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cxVLX0ChZz1xtT;
	Wed, 29 Oct 2025 14:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1761748903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S1xXs3JGvgEgRE8/1iINIBl8/G8ZW5nPLsCFO5WNNV0=;
	b=aTHNEf/TnTquIxOWInYfDDw0QevBSwKkHEJE/6vbCJQM1iNFWM51fjwTq9EAa+mTsTrYwZ
	vV2AjwVGgO1JRwKU7PPOJS8YvnGYfx6AuJh8sBDj8+PsufMUh+wx9+575Vqx5rwDFoGMES
	0kcc4EG6lv9H5GM884Sa677DwQm1/uEzftU4PzLO3sedt4DZK5ParJh1A2Li57V2jOlVii
	MjKQ2uvY2X8qGmdqo1CYuJN2HSQ7Kl7l8UAjzDGF97sZl6IPETXndKg+ONej2dAfktovuA
	HjYxrk9I/zAv/CWN4En5fGw378QPqUKXB54XlBdnFWBwTcFdXvSiTjPT+009Vw==
Message-ID: <6e4bf564-07e9-44a3-a18f-69bc716ca575@rootcommit.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/5] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
To: Joshua Milas <josh.milas@gmail.com>, tglx@linutronix.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, unicorn_wang@outlook.com,
 inochiama@gmail.com, paul.walmsley@sifive.com, samuel.holland@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
 thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
 liujingqi@lanxincomputing.com
References: <20251029001052.36774-1-josh.milas@gmail.com>
 <20251029001052.36774-3-josh.milas@gmail.com>
 <4b1b2580-63ce-4ce8-b4a9-1763d3d3a253@rootcommit.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <4b1b2580-63ce-4ce8-b4a9-1763d3d3a253@rootcommit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Wed, 29 Oct 2025 14:41:40 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Lflu6Sfi c=1 sm=1 tr=0 ts=690227a6 a=cfTWVnPyVfvWbvVVnrj+XQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=-d3y0XjIFKyu09ZH-IMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=URPqgtl0u8oA:10 a=NcxpMcIZDGm-g932nG_k:22
X-CM-Envelope: MS4xfHOzqohSyERV3CJIWO+IJIU8BQRPxIPwrQrUV+4GAs1IWYTl+vbhEX6eXClg5kyn3CmwykLaUiQ7Puc9aw+ckgifACezeIajAZLft/NMzaxbl1bjqTH/ cmK5oYOArSLZRvcIdNSH8xa9NPck0uNuLsKc5gex+MidQzKfJazvwkSSkh3zrWfQew2oG6ebqZE2XhwlJjSA/KHFmWHC+eYCRCU73jCIem2k305uXDvS3cZH IYkM2M1HMvQzzdDZq4h4FZ57vNsZ4Xnebs4BTkuc5WHnASdCVtLd4Felqspt7WZo8+tqgms+KVzGzt5AQtxnjIXAFTvCJRk5eS1ylwNdcgTjQz9R6SLm3I/w z3H1GeCV4+8hMSktb6P34ME7Qwzi/MJNJ1LgGoi+bTPDJMkmb3Ol3CDXghCGXXkgQHiQH9hxI2HM6JwcaylQSb2E4LlDDwl77s7OvTHGFvR6ohBsX0kwTXSa +phUG42SvbicvWSpSoLouBPHAYqv8P9ZmNEiutoWWUb8288YPcXhH8SmvwWnyvOXuOQhrU36LPx2nnjbn5yc2o0jIxV0rQieYY2mnK8n49306fJYKhAEteUL XF0D+RX7os5d39KXaa+mflRdTktPHjBszKHnuhrX1HkE8yxFrT0K9rptPA2CYTepyn97RqT9aKpUveWyCDeG5KH3QfJ7bT0EmLVKpg1rrxb1rCiNBEAVP4yC L0DxS7hY4X2fm3AtfNq7ls/6CHRD/c4+CQkAQKs4IgT0Kb2lS0lDmmO2QJGO5HLE5Xp5lIutq7Fwg3iSBXcgb8NjGEK76DcMbW62G0XXIfhc2lQlPC4wRB0U eubIa1NRquaD8ce5e4rAvWokg1vktm0qW9iraNtqp8cCqlJspet8NEVsZiRrxdC/fnvTSiotIZRECtjNuV3xcvvPyMm2W+Tj4Y71a9LBRgFK6YKuRgH49WsS 1B8jGMBo2yXd3ah
 5ilCweGa3rx1sj85eeFLn9JjmjPbD8fCGa7d5SlNrB2O8u5DRdJOsgA==
X-AuthUser: michael.opdenacker@rootcommit.com

Greetings,

On 10/29/25 13:35, Michael Opdenacker wrote:
>
> I managed to boot the board and run tests:
>
> Tested successfully:
>
>  * uart0: boot console
>  * mmc0 (sdhci0?): root filesystem
>
> Issues


...
I realize I replied to the arm64 part of the thread, but indeed I ran my 
tests on riscv.
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/

