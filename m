Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B121219F121
	for <sophgo@lists.linux.dev>; Thu,  1 Oct 2026 17:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790874201; cv=none; b=G6T6oHDmiUbbzH2BO6L03prVlghLGMwhH4TvvjdKQ3p6Il6rpN6BzlVQw33cCXK+wvPxkl9UPOXZgbcQttxtBUq5cVY3GfSLjSpficASnDWw49Ppbj9LmfmFQJE9AFADH53yO9sfMcwhKzofOj1cNAxTVHhZpEeaCOR0YCtwqB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790874201; c=relaxed/simple;
	bh=AATMWNx/td8CMo3aSPUQaxRxKv0aYs/TyeFme5JpK98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d/TXpZkyaFxHR8EDwMsQwKBgOFR7GuEGY3B3ETvAD4zkr1S4zpXOwgG/6oNTYFMuEcHZn7sHFtx23G342hsfWQl+QI9B+8kJCi3BW6BSXJBcyIAPbImmlJEtgiY8jDJDkNN80EqO3xfvhdX/rbzlBvqxj+VhDlwtu7o8p5RpAK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dszddE9J; arc=none smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dszddE9J"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-67567ff2e77so3036939d50.0
        for <sophgo@lists.linux.dev>; Thu, 01 Oct 2026 10:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790874188; x=1791478988; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6YmMQO9LMPUNWHq4u3cbpwC28RlhwiegEC8VRXjjLP4=;
        b=dszddE9JXEC/JGLHM/+fgT1MGJRKOSih+sLhAlZ0LVFDCLkbTotZ15ZK2gBNb0vftc
         8mReVOZgqW/6Fgl0UfgacIt10ZRwvLJKdWC/wRgHa8eMN9tg5sfL7ip6EVlEQg+O/Dtg
         9uA3ETsGFpVCKNcRTvd+f7VMo54GykmkyuFGi7+c/2aIW3POd5XKmg7BcGQdc00RHD/H
         NVh6lprXyPJwlLOqZPUvl3YB22E8wneesPg69ck66cQKomI6S5hN6AmjSLxriIylmhYK
         MZThhYzIo4xltNdGEmlx7cyqRBbzqKKBwOJDTsDhbYXciCMrebJ9rHY+2MnQCWhk9bU1
         NKLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790874188; x=1791478988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6YmMQO9LMPUNWHq4u3cbpwC28RlhwiegEC8VRXjjLP4=;
        b=G6MlIQxKWaPxZlq0WxV2r8ELSSWcK2/DAGf4/oeaI2Kel6no+4QBz63asMExIf7i9e
         lKmWD91xTGAVQac5/RJWIDy/Eao66jR+ABLW32r6RWvifZJf+NlMu324fN1WSUB4E1Bo
         HjcOYMjhSnkWQG1fXpbWQVWFYttQLTFJqk5sJJbo07ODzdOOwKqOp0N6Zo+U2rPaXWcJ
         AvzWzLGp2TlOhX5xEiug8D3CU5w9vWDTE/s7jgNOCuDCR+SL7eVmw3YAsq59qW3CYzoo
         FA265sWPZVUjNli13eJBBFI42BWIgE6AZuy/v5da/uW7kHIKQNsNnszRgiV3iRyvo6sc
         ok3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzmhkWIHgkxjJGOvuAtsBRxr6VZ7HGs/Ad8ReEGTjFagn5z6O9DDcfOyzqxGCtXvQYzfwm4k5c=@lists.linux.dev
X-Gm-Message-State: AFq9FYKEpQNMrnNU27KfTVPXohtitgyX5paFDiCu7BEV3aShXasMVI/X
	VcGZmjclTGtL4ENDcpO7nkots2MbUlg8JeERTf4vRzwX2yv1m2tf3+i+ghpoc9M3qY4=
X-Gm-Gg: AYBFou2WRWf2nDlU5zCcx8kmG5H35OsuWTMxFNDggwZfaeh7J+NRtnRfZH+Zq0V1Tej
	GGnCpLOAeen94yiEQKDZhxfSYc4d90mZXCepS8x3vTvlp8rrxPrIG/Mp8egt0UgSYX//fxVMo7x
	oTLTyatVNBbRg9smNbn3r9cNhnzAeWhmPyvcmbQHRgVIY6G5JdMaTOF4bZUr1XVBKLfBdUVPIfH
	gDPLr/gQAFPqrjL6ga2xwa4Pf+pCwHAMC0ri+Os4Gn9Whwjipd0sDTNRGbY507IGzOIFGScS74X
	efSQ9V1t2p2UkXW/vNrWKgx/svG5/QgqdZatvwYjMmNm4b0TCNeEUKMRZ8V4oIoD0Sh693kYvRP
	jqaZsnYuDe1ysh1w5k3Gy0B0ie8d1Dc6fICPNCxPM/YWiXOJlVIoV7dtvGKtr5WJEpV+HmXO31z
	7NSL23VZSezRQwSZQ467UBo9mM1WzJquDR1G/BvBOgmmEaRCtkLWU7is1NK7M6yXonR/+3S0c1+
	Hlrc0+Z2it2eR9Q8UuyZ8sFMnva6NSn
X-Received: by 2002:a05:690e:480b:b0:675:67be:3251 with SMTP id 956f58d0204a3-6768349058bmr1756658d50.62.1790874187795;
        Thu, 01 Oct 2026 10:03:07 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:8bf0::ffae])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677abafb2easm26948d50.4.2026.10.01.10.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:03:07 -0700 (PDT)
Date: Thu, 1 Oct 2026 14:03:01 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH] riscv: dts: sophgo: cv1800b-milkv-duo: enable ethernet
Message-ID: <ar6R5Df_uliYg1l6@hiagonb>
References: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
 <20261001151447.12076-1-andrey.lalaev@gmail.com>
 <ar6E4bQAKonCW3st@hiagonb>
 <e5f84c5e-e281-45af-8d25-62bbf585c94e@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5f84c5e-e281-45af-8d25-62bbf585c94e@gmail.com>

On Thu, Oct 01, 2026 at 06:57:08PM +0200, Andrei Lalaev wrote:
> Hi Hiago,
> 
> On 01.10.26 18:08, Hiago De Franco wrote:
> > Hi Andrei,
> > 
> > On Thu, Oct 01, 2026 at 05:14:47PM +0200, Andrei Lalaev wrote:
> >> Hi Hiago,
> >>
> >> Please take a look at the patch [1] and the discussion.
> > 
> > Thanks for letting me know, I missed this patch. Do you happen to know
> > if any overlay was sent? I was not able to find one.
> 
> I haven't seen it, so I guess no.

Ok, I will sent this patch as an overlay.

Please, forget about this patch. I will soon send another one.

Thanks.

> 
> > If none was sent, I am happy to send one. Sorry for all the noise here.
> >>>> Thank you!
> >>
> >> 1 - https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
> >>
> >> Best regards,
> >> Andrei Lalaev
> > 
> > Best regards,
> 
> 
> -- 
> Best regards,
> Andrei Lalaev
-- 
Best regards,
Hiago
