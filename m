Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A53175A86
	for <sophgo@lists.linux.dev>; Thu,  7 May 2026 02:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778120179; cv=none; b=W0xLwZ31g8uvpJuSE3i1FRxtnpmiSoNn1Mb9l46NTUEw9Nle4TxUWLpaQdG+bj6eyc8UvKX4R+kt75V0yhjvqJ3y1u393Fb/gRgOEumgHvGu0b26ZZ+lEAiK7UEsOrAqSU3uJIU2ydjvEqoIGWbWiqD376AP+3UIXUC2eO69PEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778120179; c=relaxed/simple;
	bh=NuuFYpNq1GDMFSV69cLSsOdgpGK4hwNVlgkE2tp6JUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JGf23Lyc+0wJdb7Y495AW/SNINL+J9Ghp66H1eTKNhlpu8pQhwe5qhR4yLl2DzN8BhaJyf+rHEPA8Hg8CM76aFRxtcC3X1+hkQZTgUM5qTMkUnD87B5zv6ovYMRFLB1UNjWTRwu9N8tia7F9CHJd1joXLV1BCN0y683vnySSC0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gALSukgR; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gALSukgR"
Message-ID: <4487e6a9-89c4-487f-a1de-03ffb1c92608@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778120175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KltlwRoBI+wZn1I5Ejmdp/7ZqnXFJv4MU+T4Qg9q3aY=;
	b=gALSukgRjLcm/5HiF28P4mqPaehxzqE457ac/FCMIKDCog6f5ePAYUJvPAjJmubZ/oT66S
	ZvXSll01cr5v+ZpK5lERZoMuxS58SdVCfpofETr2/Lt1EhG7Khf1as4VtnjMMywehpoEZE
	O0Iv06YjLaGhwixhbTcbjyYW/yVYWgI=
Date: Thu, 7 May 2026 10:16:09 +0800
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] MAINTAINERS: update Chen Wang's email address
To: linux-kernel@vger.kernel.org, sophgo@lists.linux.dev
References: <20260507020553.3494-1-chen.wang@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chen Wang <chen.wang@linux.dev>
In-Reply-To: <20260507020553.3494-1-chen.wang@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Sorry, I made a mistake in my submission. Please ignore this email and I 
will resubmit.

Chen

On 5/7/2026 10:05 AM, Chen Wang wrote:
> Update my email address as my original email provider may
> block emails in kernel development.
>
> Signed-off-by: Chen Wang <chen.wang@linux.dev>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 882214b0e7db..e02030d212d7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24966,7 +24966,7 @@ F:	drivers/char/sonypi.c
>   F:	drivers/platform/x86/sony-laptop.c
>   
>   SOPHGO DEVICETREES and DRIVERS
> -M:	Chen Wang <unicorn_wang@outlook.com>
> +M:	Chen Wang <chen.wang@linux.dev>
>   M:	Inochi Amaoto <inochiama@gmail.com>
>   L:	sophgo@lists.linux.dev
>   W:	https://github.com/sophgo/linux/wiki
>
> base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
> prerequisite-patch-id: f7a13f5fe9b7385691285f65c40ed96ead6ea204
> prerequisite-patch-id: 870f4d1ab461c09cfa347f19af913560f331b1e6
> prerequisite-patch-id: 73271cf78d3a57ba78ce6aed98ef33b0ea8f2641
> prerequisite-patch-id: 24e93561bcd53d94c8debe9b178491f0f41bd7e8
> prerequisite-patch-id: 6c20704b20318ec86736a6c27e3f03272d3d4bbb
> prerequisite-patch-id: a4e5ad2d76ed00d40fcd0dec3023261e231cb63f
> prerequisite-patch-id: f14ffe7b0b597a26e6fb2ac90153ef76bf03c53c
> prerequisite-patch-id: 2d2ea0c7d69c21b0fe0d5b610785718d957427d0
> prerequisite-patch-id: ac435e70a78c1ce193ba57fe92ae8141436fada9
> prerequisite-patch-id: 617e245c13d42aa58b70d12284e80232700bd10b
> prerequisite-patch-id: f6c297020d8e5e27fe0854ba1275e06f447bb5c8
> prerequisite-patch-id: 3872c564996c6030c027f70b4a3d6a4e18030c8e
> prerequisite-patch-id: 537b0f7f723f16137f26ac4adee1e4a72a3dec13
> prerequisite-patch-id: 5e85a63d14610c43b9f4bb3f555992e6fec064fc
> prerequisite-patch-id: d4f40aee0948578a4195456554ba88c228d5bf7f
> prerequisite-patch-id: 56c28900d9d7adea471b735cd8138e82c1f0010f
> prerequisite-patch-id: cbbd40736f7a797ff76b0fe2b1ddfb559e14e666
> prerequisite-patch-id: a6ab06b39ad20e8125dc6fcd475d1d09aa81f5a0
> prerequisite-patch-id: 18d618f0ba2a6896495705c64eec2c900bcee476
> prerequisite-patch-id: a3dc8f367bfcf60d1f58e7f20042d8da81cb6d51
> prerequisite-patch-id: a08073cd4439a2a767937690ddc615cb8b807269
> prerequisite-patch-id: 4b172397f419f5a7caea3d7aa596bfbd18eec664
> prerequisite-patch-id: 7369b031cf7fcccadb063a96136884e6e5d5b969
> prerequisite-patch-id: d43f35f7f5cea68e28748c8273d4ae872e4a86e7
> prerequisite-patch-id: 6a9e6c965f84d8c0f678635e7e7731918eb6a1c6
> prerequisite-patch-id: 95fa568c295a8aea00cc27138a37db799bd8b7d5
> prerequisite-patch-id: 8600f2ab973650fffea03506e5f7246ce7bd5ce8
> prerequisite-patch-id: e958cd86a4513ef806f6a43e4ac9f60edbfde1f3
> prerequisite-patch-id: 09f8cc09c6658305e84f07908b0b363ed243c994
> prerequisite-patch-id: d2f9cd9d5ce98554fc89cb1c650906a29fc20a46
> prerequisite-patch-id: e266533a6a4e6cb0b5145ec670785e40d0c9b5f7
> prerequisite-patch-id: fd9c6beaf036035461da4781456ebe07b68beedb
> prerequisite-patch-id: 1148c07076e6f0c4184f6cba481f3e12b55ad60e
> prerequisite-patch-id: 80b62566ce916597b0b77201432760ae14623f1b
> prerequisite-patch-id: cc4a84f6f5f5fea21624b9c165931f0f41327823
> prerequisite-patch-id: 247f1d08e485c99bc3c8cc9258f648e0634fb51a
> prerequisite-patch-id: 1e60cda8505ce92f307b4cff325e08a6108bfb80
> prerequisite-patch-id: e924e8e1445e57f6815a828f662460ecd52ab446
> prerequisite-patch-id: a9f3a2bd0f2388bcd4c1ff26d3341314af2ed86e
> prerequisite-patch-id: 31660597e88829c0eb6a5425db64f67bb08fb0de
> prerequisite-patch-id: 7343930ce834b8d1f2322176f67b8328fa67b472
> prerequisite-patch-id: 1088659376bba6d4940ea978254cb1f4e592d71b
> prerequisite-patch-id: 1e173ab84bc2dfc655b3f72bffa2909d7f7e7262
> prerequisite-patch-id: 0ec60c43ce907b525e2d66b6697181a4b4d0e884
> prerequisite-patch-id: 6cda5acf950ee511c1ae1a6cac1b4db66b23bea0
> prerequisite-patch-id: 87eecb3c6356cceb7866fa624ade14d75a23d7ac
> prerequisite-patch-id: 95f851750545048e321d39c6e8d59b92c0ff641d
> prerequisite-patch-id: 37dd3e696361d085e9a6e502a3d9a797b2e79ded
> prerequisite-patch-id: dc43dcc3cac2f41f1317907cf48677fea8c7ab4a
> prerequisite-patch-id: aee003b28a02c5e81d7f9a2da44856e6c4111d8d
> prerequisite-patch-id: 697628a0ba7c798c374e783150a2191443b65c29
> prerequisite-patch-id: 2b33296ec751a1b6dc38c167d36e2a70bf003587
> prerequisite-patch-id: 021cd4566231f1af81ee72212cd97fea14db40bc
> prerequisite-patch-id: b4ab81828c99dddbeea8c2f90e6b3847e31000fd
> prerequisite-patch-id: 22164571a12599c0fd4ee93a587c458562708893
> prerequisite-patch-id: 53845a066472b948c230ec37ba4ee6e3b0e60a3b
> prerequisite-patch-id: 64b395397f969735e01b7ead9d4629f30d6ac145
> prerequisite-patch-id: a82a38da664bb7641277e95df1fbc491cae163fa
> prerequisite-patch-id: 787f4f21ac201c9166e8b26318b83e38381bed3c
> prerequisite-patch-id: 11a95b61e00433261a64002db020dd682f5beedc
> prerequisite-patch-id: 0925ded35e6cba318fa5f8c639704c926aff8484
> prerequisite-patch-id: 82733874c84dfa0c2f1caa20d8460f2d636b8bc2
> prerequisite-patch-id: befd12128fa141b47cfb6fa7f4bcab0144f5e357
> prerequisite-patch-id: 9d7d831ef81c95631b66161fb193ba37bc46279b
> prerequisite-patch-id: f3af16ae52afd37d0f907f5c38b389a4b065f009
