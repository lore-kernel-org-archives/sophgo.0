Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31180288C2E
	for <sophgo@lists.linux.dev>; Mon,  7 Jul 2025 21:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751924617; cv=none; b=LmLvhd7aH/XQfY3O9Imwhqt38+f5s6NfJgM8oGFpkR9zzLFYF23D0/RICUzIoOsHdHBqLhGFeRyFUoxzcReyt5eMtkICNKlQXANrCqZGWcoPhfOr6k/wojo+jYIx97M40g1iULzRRlx3BymndV4JSO2ODUwcD/DKsGRUFTAqyW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751924617; c=relaxed/simple;
	bh=JKBeCT498slZfSl8yFGScD1UeY1R44vvzwh2PnvkPnU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvBsXgAo8XML4IGvcR+eNVHXaP0RbadqvBiUT6FwasPSqpf4sOyfatDaEWv/Usnfzi/vAwPPs6m+Yj19ZtdAMhmA6MvAYdR8jxOWJ/Npvj8gOZJ5w9WMFnXchALsVktEc5kHCRPfLryFKYPLUc1InkjTLlSF7datZWKQe442+UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Q8KYjyiL; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Q8KYjyiL"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67414433F0;
	Mon,  7 Jul 2025 21:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751924614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yptNmMRmeGdloKhaVFB2GA1LrZmkRmVsjBDRh0nF3xk=;
	b=Q8KYjyiLYxGIx2dio9By4ZBzK/vS+whO6POMVajMU09mfvRInF/qSC4ElPaXBllee/A4q0
	lNzWXdJxdTuOYd4CqngQb1+hJ+jkFiu8DQ6eY25mcvagjD/4http/mGB+gUj7WxAoxQR08
	y8NIZci2skJvbLN4kbts3YE98y6wWBgEM6lI2Sp7HXVpxO1zTecb1SBe/n+bMuhseC/8CA
	MxSHQl2ZBPb07MFEu9D8utAexnWHV+QB2WmEUUa0yblzmLxDvPo1Iq/5X3WC1VWGjYLlse
	NlalzJaQnkg0Qdp0txtj7YknuKHUgWFKoq0606v32l7i7SZI4+ErkDUrHBi12A==
Date: Mon, 7 Jul 2025 23:43:33 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Move sophgo,cv1800b-rtc to rtc directory
Message-ID: <175192458509.1515124.15817923991833285184.b4-ty@bootlin.com>
References: <20250608224252.3902421-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608224252.3902421-1-robh@kernel.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefvdeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeijeefhfffkeejueehveeuveejvdelveejteduffehuedtffdufeejudffuedvtdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehun
 hhitghorhhnpgifrghnghesohhuthhlohhokhdrtghomhdprhgtphhtthhopehinhhotghhihgrmhgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhophhhghhosehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepqhhiuhhjihhnghgsrghordgulhhmuhesghhmrghilhdrtghomhdprhgtphhtthhopegrlhgvgigrnhguvghrrdhsvhgvrhgulhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com

On Sun, 08 Jun 2025 17:42:51 -0500, Rob Herring (Arm) wrote:
> The $id path for the sophgo,cv1800b-rtc binding was missing part of the
> path 'soc'. However, the correct place for RTC bindings (even if it's
> also a "syscon") is the rtc directory, so move the binding there while
> fixing the $id value.
> 
> 

Applied, thanks!

[1/1] dt-bindings: Move sophgo,cv1800b-rtc to rtc directory
      https://git.kernel.org/abelloni/c/590951f908f2

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
