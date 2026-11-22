Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795348255;
	b=JN+Cm91O5+rE0U7zZ8b9fsaKlX3U1OC5KTqhs1oV0C/YsBOmLuq6qHxBHUuThd4Qj1Qs
	 /fbz2pzQX44Mza84bn25kE5Ke4sDSKDktI1h/uCUb7MxvwqrXH1q9CgcFVN5dLJzjKM6K
	 VLEdZlq7W9+bQbZIgssvdOnhgX/VhA8aBI1FqUKMTOcNsyy3kblIpnqa9bTwMCgJ37Rqj
	 96rhcgfCQBjl39f1iVgiMpSweopfQPvIK4MkeDM07fsBCtQwZSLpV9sa6uSTfw29Wo2VX
	 aR+J7EqIFHoLSAJN96uMZuiC4i+JCgtljsJi4L6VFTGNpIprmXvkRjCzK7i3xQsi+tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795348255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=cB68K9VszL8x8rzgkP/c3kcIxRgyD3G47ftVYkV0bxo=;
	b=M1KLBsklVqO0gy7JgSEN8uZsxjWDdA6zA6E3bacmoIxFR3MfxMxt5Mf+Hib2YGhs0i/o
	 fL7xqYmXDa6psUqeClDymrimxCwDvMJ+bisURanf8LcShLM/2U+a+ui2H0vla3GCWPHYo
	 s7Xu15uAc019ZgHDsc8dXNJ8nVLGwlaz4Tmf8/juTDH71U5Wo1HgRQW+aHliy5ywAQ92S
	 2uQHBhL/VAjGBsH8P7GLXjn1PtiH0dkz/YGJXC7xnFZxANgZKPdF/zBE4sIEOqD0QsQj0
	 QJfvt9tH04QqTcY8nSKZH1yt9tiYQgRGj+r2civ5Kxy5rE3NMnAQmWm46mtILmwVcHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=d+F6GccI;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705DA606A32A
	for <sophgo@lists.linux.dev>; Sun, 22 Nov 2026 11:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 705DA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=d+F6GccI
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb77a462c6so25455215e9.1
        for <sophgo@lists.linux.dev>; Sun, 22 Nov 2026 03:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795348253; x=1795953053; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cB68K9VszL8x8rzgkP/c3kcIxRgyD3G47ftVYkV0bxo=;
        b=d+F6GccIHiyTNuYBP+f3+7kJmBJj/i/FSdmfyBZ1E64Mixe6ejn0ATMZNAW/yfJrue
         JVWV6gn5WtJ6NMYbloGysB1q+Ht16UfK3ScAMGWW20dxREMu0cUKffdmIXoqT75UWWSX
         ypDLlmOnBbaEU6tIDe9UxGQ/0cd+z43AOL4dEeizqGE1dc7x4vFRZ8hAnh1+62PzZgiS
         PE90VZt0VukbGtgmHPDDYT4ziC7fkQVYgTkv0JOFCM9ouyLi1qCM0EqxqawL+DMox8al
         J1N5Nz+XJEVdHHEFW0u6XIoJuV2rJuFmkPDbhcuNTn4dBEUmMCK9upBuMYe023ueq6BF
         Bgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795348253; x=1795953053;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cB68K9VszL8x8rzgkP/c3kcIxRgyD3G47ftVYkV0bxo=;
        b=pcFBh9qgLk858PEKdhlilShA8PaTgirT25YKW6GWJV7dfkZwFdw0AcElYGMcZOiHcg
         vWiUUueAstc+i9dpbTu96IXJbqUT4SQtiLPTX8HbJzapTuwcJDojU+23KDQK9Jn7kknf
         qzob2A17ogJpAMIkM2+178hlAOozEFs+BH3vryDUg8nlcsurlKvRXKEB0n27VZbkasIJ
         HVV3UFHN7G/Q68gPDhnU+CN0VuZloxeKoSVbsfglpc1Rf8uuwjmg1u+ejU4T095+Vhat
         COdBlo6QuJ5ZYcJD8XMvMNY3LCD9Rqgcoy3E3+p26IuLecx7SDETgc82ZHP6am+hfTlb
         PtkA==
X-Forwarded-Encrypted: i=1; AL+hErHUyCbC0D8r7tKW+hgNoOri/ZwCS5Fo17p1oOZGpO+/7wbNr1drvUz4fZJzAmmupn9CNJmfgyE=@lists.linux.dev
X-Gm-Message-State: APuU4Z949tpZt88QK40z+r8/2WEozJjfAmWDOrx4q6JhfPKoDk5RjXyi
	rlGc21XlHntVRx8NsKo8OyGQynC119SJ7EzXWDN69WaOCSDsJ+nuio6KZXACvqn5LbP6Bmxy/nS
	8fg09dUXRMg==
X-Gm-Gg: AZFdTZdru8n/SKpresubLqGIVp9jfOkS3BTcSAsf7wFY9A+hHXyDm1HYLKSfnVEHfOS
	lPNsPO7zra3WU5bn0Lm4wuB2KlHfvPh4iGToE6bbT2dJ5a9xRvPtBCR1hULgdPHLyo+9Cx/kc1X
	bzGs5i50X9HqY6oB8+4QfsbbZ73NSgQE0wMMm15iYza4UHRIzsvhINKEzIfWAP26Y4lAnqw88K6
	Ovan6R5hyF1KI+Bd6Hzz/l3fKe5O9UIxD6GotysTmYyQQqQARCOmVLK+jQMYBvWKk6gH5wWGwn0
	0zes7GpS43wqPuBkkzyT1tV2QYG+yBYF/beVfV+Tt9NGEzq6bi3EAlNmapF30aIEH7vZwXpt30K
	J2ArtmoiIAGRuJRGGqpFvwqsyoW/RpaNDPNWOQb6rBULzETzS7VsDwxm9dVqGx1MdkWKaBrJUTU
	7hFVt8OGCz8DaR6eVj35XJoEfSWcGh/tDiA8bENEklDOp+avxoO3AREXJl+EP7Y2fSKihW6FnSd
	te05IOtPVaO9xxsXIpGtgTPH5HJ7dR3S4z4/kks6pU7Nm8nsjA8GjFutRFGEcJsCKiw3S8p6VNK
	guFucbIzm0wXuCgpC+iItrdnoQpqJE926SK68tzdTnXTSW35
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr173405365e9.7.1795348252406;
        Sun, 22 Nov 2026 03:50:52 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b39b6sm224616505e9.12.2026.11.22.03.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 03:50:51 -0800 (PST)
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 2/2] clk: sophgo: Keep SG2042 gates listed in
 protected-clocks enabled
From: Jerome Brunet <jbrunet@baylibre.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: gaohan@iscas.ac.cn, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Yao Zi <me@ziyao.cc>, Chen Wang <unicorn_wang@outlook.com>, 
 Han Gao <rabenda.cn@gmail.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <awIs42O_vJN3gB7l@inochi.infowork>
References: <20261122-b4-sg2042-efi-rtc-v2-0-6d087e03e4e8@iscas.ac.cn>
 <20261122-b4-sg2042-efi-rtc-v2-2-6d087e03e4e8@iscas.ac.cn>
 <awIs42O_vJN3gB7l@inochi.infowork>
Date: Sun, 22 Nov 2026 12:50:50 +0100
Message-Id: <179534825090.2640804.3856644920774930042.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3068; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=IdvAZSlfVMHZbcbQ9G6YqRxqWmYmrg7EOTVCXlS1rG0=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNlM16Wzti9b2Wcj+sZr/8Q3E4TmvSufv1fHe5WQhkfj0
 X8WB/JlOkpZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjCRHVMZ/sf6PNWvYa1VURFr
 F0ydaZ7j9G934ovvrXmKRy+Hcz3l+cfwP++79vPLcQoXdE3O1TXcuHF2/95D0RMVjNUXfO+d4nf
 BlwMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-22 07:48 +0800, Inochi Amaoto wrote:
> On Sun, Nov 22, 2026 at 02:18:05AM +0800, Han Gao via B4 Relay wrote:
> > From: Han Gao <gaohan@iscas.ac.cn>
> > 
> > On Milk-V Pioneer, EFI runtime services use I2C0 and the serial flash,
> > while Linux drives other devices behind the same gates. When those
> > devices runtime-suspend, the gates are turned off under the firmware.
> > 
> > Mark gates listed in protected-clocks as critical. Unlike qcom, still
> > register them, since Linux devices use them too.
> > 
> > Suggested-by: Yao Zi <me@ziyao.cc>
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  drivers/clk/sophgo/clk-sg2042-clkgen.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> > index 6abc2c973c49..65ab18f701e1 100644
> > --- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
> > +++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> > @@ -840,6 +840,18 @@ static int sg2042_clk_register_divs(struct device *dev,
> >  	return ret;
> >  }
> >  
> > +static unsigned long sg2042_gate_flags(struct device *dev,
> > +				       const struct sg2042_gate_clock *gate)
> > +{
> > +	u32 id;
> > +
> > +	of_property_for_each_u32(dev->of_node, "protected-clocks", id)
> > +		if (id == gate->id)

If you are going to do it this way, restricting to gates looks like a
pitfall that would difficult to anticipate from the DT side.

> > +			return gate->hw.init->flags | CLK_IS_CRITICAL;
> > +
> > +	return gate->hw.init->flags;
> > +}
> > +
> 
> I have a question on this: since a procteded clock should not be touched
> by a driver. Is this logic necessary? I guess this is a shared clock
> topology between the kernel and the firmare?
> 
> Regards,
> Inochi

It depends what the intent is with protected-clocks here. This apparently
starte as a qcom specific flag and it might, unfortunately, be a bit
confusing with CCF existing concept of clock protection.

CCF concept of protected (or exlusive) clock is basically a clock that do not
tolerate rate change or glitch, resulting from a direct rate change of the
clock from another consumer or one of its parents. Essentially, all the tree
leading to the related clock gets locked.

This is accessed with the consumer API clk_rate_exclusive_get/put().
CLK_IS_CRITICAL is special case where the clock is locked and protected by
the provider, even in the absence of a consumer. Consumer can still get
the clock, enable or disable it but it won't ever result in the HW actually
turning the clock off. clk_set_rate() will error out if the request would
result in a disallowed glitch.

Apparently Qcom use of the flag is to skip the registration of clock,
presumably because they've got something else controlling the clock.
An alternative to this is register the clock with RO ops and NO_CACHE,
this way CCF still expose the clock but does not touch it and you can
still get it in drivers if need be.

-- 
Jerome

