Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304932;
	b=locbDyvPHtcKKhihn9D0xKO/EqpT1u6nNllhWeWHskPCWbEvO3JceRrXaDPp8NTC06JD
	 p2LC6Z1kr7ZpWPk2wq2d9hOSp8btOWBqUyUiO77P4uUwYFceDnfbpB32L9x1dB94s0jqT
	 QaqCIRHWDLG+RQs6LBEa+vdqaYBLJ7cebUThoSAS3XLV0GlF3SKRU+PiV1lneyylnku96
	 3JprgyoQQ5hewTqfwMA5mAw14Ug0VqjzHdeJszArrfgTziPnA1SMeOpamskTTyrPq+eTm
	 FAZm5/M8pJiSdd9Bnfxw3r0d3szETEr6GTynOKNFD8c/obn2GKegXYM+jZP+b3pSufg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wM708HwhUcKpDxEYjydx9KDWixNA1iE81j9OUZhkFbw=;
	b=SGGG2jYx0QQcJwyk+pkJKNiaMPf1I40QOMyA7FkAY+LMh7w9CZEaCHjgcIvC7Z9Srte7
	 /RJgNXYZnoqtsobUi4z4G+RAW+Tl1ch11VrFuAIqfBLQjWEGQy4AruG0v2cwa9RnBWlDv
	 +20xyt3Hvie0oM4gEMpV4qE2WcBg9yfSorSrsUzYDrm9riaSEShLNbq3VSug7lv1V7I+v
	 5LeB/coZYWO49U6RWJ7bk2OXw/k76ruUxi9w3XF4wIwLhH8sKRVL4CVvL7T+D26Bi+h1r
	 k9FTEv4RRqC/bM9nWtEQx7+erGPTdintl39qjKcAncdwU6BTxBG2jsPOY7CWmZF9bMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="pVXCS7/k";
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AAF606A331
	for <sophgo@lists.linux.dev>; Sat, 21 Nov 2026 23:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6AAF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pVXCS7/k
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f04bea9a93so16169325ad.3
        for <sophgo@lists.linux.dev>; Sat, 21 Nov 2026 15:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795304931; x=1795909731; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wM708HwhUcKpDxEYjydx9KDWixNA1iE81j9OUZhkFbw=;
        b=pVXCS7/kuqZcEqf/0A/CpD2ipmFAo75yZbZFSuXViJyiJB6pwu5NKgt2rEiMEV2pQV
         yVieVNewtT8/dwFFtQKydEcY/voaGlrjdlReyI+KrBJQfdjRQXj7rRrMDsdS9lUWPebD
         Zm/tJpYH8ywePJLkyeOhobQE9aIPZxrFUjKrRdRzg+GCDjxgxCA27Sm23BeU3GHpmbTN
         smD7C3IFTjfce6U6N8KjzKTFH04oylEdRDN5eTOc5LTgAvODhkIFoNPFfa7mAzS+uan0
         Nh6x/YVgmdvPZuSSs/gqJOcwNw48fbGNeFNeoTyi/6qaDo2DZvSc4W1jIA6IgjA3PLhG
         SbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795304931; x=1795909731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wM708HwhUcKpDxEYjydx9KDWixNA1iE81j9OUZhkFbw=;
        b=y2cHTeuiCdfx+2+9zPRtqBhmwlnqQBV7cW1hlFqUA1g4/3i9zpfNsU2IKOeJCbfHtj
         CkO4CYr/80bJlwLmZJJmeGn8i/XcnyACcpmwTq0Ha8sdbHVQ7hTgDISmCN1/qmaXBp1j
         WOWuq2mk66UOyoPCG1+1Wu9OsZCVk6w/1fWAwgtYH0qDdqfnskmE82wVqAIlOfq+m5oO
         LhTv31OUXGJG9y37pUYhUQ94WiGRb8rFP0wMrZHUZ8pppgbWaOY3aj/MjH/0awh3hsDJ
         wcza4XUfA8Z2k5vm/GqvxZRfqGkkmZUnxRmYyZD+qWtcev25NHrKx25nmLLc60D9Z+JE
         uq+w==
X-Forwarded-Encrypted: i=1; AL+hErENxxJDBmk8KW5eIGQ5HkannXI39Z0LMPxUBTaWGzYpbF+PJeMmAaqz1ZbTWN7rIXc/LzsjSnU=@lists.linux.dev
X-Gm-Message-State: APuU4Z+e3HXQfvpiroFAwd/0tY/wf3geClCCLjtCNc461WXpLBe5Y6Y2
	ByzOy5bqS86G5Azajc7EZt5mRIfkiV04SZDE/dB+vRjrwWwHYO1JuUDT
X-Gm-Gg: AZFdTZf7zsCRa+qYobCUlq9OiIR/701UmXuGmbZo5nrNhMv+esNwtDPW33x7BTCXUew
	r2D9e1g1ZVBicdgq/W8LTBrnuRtRnixrMEThTjG0sMq4CPBOIaYGbsXRVlvkF9HFn5dpZPpP2xz
	NiBxPia1BU8OGOG5QjVM7rmLzFxxVYaC7WH/nMSbZhbgcYAgjJsdAU94QCsvAxk78Cu2pEThX57
	Tm3AiaFHZWrjRJiou4MxZ1V/3rJeGyaMUMolwC0gpMdcLXe/iSjIWbvnwr8BbyqEmepNtsOW/ba
	eiUnTGE40RNmymwgfGBpeCk4dxGC+bpmpPe4CPHE5vHvWCQu0iB71D65ZyVjBRA10nId/UASnIM
	idshnr763iTfmbvB62E2GnCTJx5COdb7N7Ya96rHV4JGjFnuHaG4NHSdqJBnS3yTi6cpKyNNp2t
	lKfDcgnM8ulE2xcZzK0xdwFeKpuWgj1InPOfuJrfdjM7MHqPwZ5j7ZFfSCezDc6TancTXVZ/rFc
	eRhcd9GneLcGFX1d7CqjWnx14v2g2/XVecqtnftd26AcGmpu25+fnn5p/1G44FAP1NkLU5X3TaU
	D1FfWFYsySLHHp9Vmr06KaZd6IU=
X-Received: by 2002:a17:90a:d2cf:b0:3b4:1714:5bfc with SMTP id 98e67ed59e1d1-3b41c9b9dc1mr6761492a91.61.1795304931081;
        Sat, 21 Nov 2026 15:48:51 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm10532985a91.1.2026.11.21.15.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:48:50 -0800 (PST)
Date: Sun, 22 Nov 2026 07:48:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: gaohan@iscas.ac.cn, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>
Cc: Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: sophgo: Keep SG2042 gates listed in
 protected-clocks enabled
Message-ID: <awIs42O_vJN3gB7l@inochi.infowork>
References: <20261122-b4-sg2042-efi-rtc-v2-0-6d087e03e4e8@iscas.ac.cn>
 <20261122-b4-sg2042-efi-rtc-v2-2-6d087e03e4e8@iscas.ac.cn>
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Post: <mailto:sophgo@lists.linux.dev>
List-Help: <mailto:sophgo+help@lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sophgo+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122-b4-sg2042-efi-rtc-v2-2-6d087e03e4e8@iscas.ac.cn>

On Sun, Nov 22, 2026 at 02:18:05AM +0800, Han Gao via B4 Relay wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
> 
> On Milk-V Pioneer, EFI runtime services use I2C0 and the serial flash,
> while Linux drives other devices behind the same gates. When those
> devices runtime-suspend, the gates are turned off under the firmware.
> 
> Mark gates listed in protected-clocks as critical. Unlike qcom, still
> register them, since Linux devices use them too.
> 
> Suggested-by: Yao Zi <me@ziyao.cc>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  drivers/clk/sophgo/clk-sg2042-clkgen.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> index 6abc2c973c49..65ab18f701e1 100644
> --- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
> +++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> @@ -840,6 +840,18 @@ static int sg2042_clk_register_divs(struct device *dev,
>  	return ret;
>  }
>  
> +static unsigned long sg2042_gate_flags(struct device *dev,
> +				       const struct sg2042_gate_clock *gate)
> +{
> +	u32 id;
> +
> +	of_property_for_each_u32(dev->of_node, "protected-clocks", id)
> +		if (id == gate->id)
> +			return gate->hw.init->flags | CLK_IS_CRITICAL;
> +
> +	return gate->hw.init->flags;
> +}
> +

I have a question on this: since a procteded clock should not be touched
by a driver. Is this logic necessary? I guess this is a shared clock
topology between the kernel and the firmare?

Regards,
Inochi

>  static int sg2042_clk_register_gates(struct device *dev,
>  				     struct sg2042_clk_data *clk_data,
>  				     const struct sg2042_gate_clock gate_clks[],
> @@ -858,7 +870,7 @@ static int sg2042_clk_register_gates(struct device *dev,
>  			 NULL,
>  			 gate->hw.init->parent_hws[0],
>  			 NULL,
> -			 gate->hw.init->flags,
> +			 sg2042_gate_flags(dev, gate),
>  			 clk_data->iobase + gate->offset_enable,
>  			 gate->bit_idx,
>  			 0,
> @@ -900,7 +912,7 @@ static int sg2042_clk_register_gates_fw(struct device *dev,
>  			(dev,
>  			 gate->hw.init->name,
>  			 gate->hw.init->parent_data,
> -			 gate->hw.init->flags,
> +			 sg2042_gate_flags(dev, gate),
>  			 clk_data->iobase + gate->offset_enable,
>  			 gate->bit_idx,
>  			 0,
> 
> -- 
> 2.55.0
> 
> 
