Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8FD23A994
	for <sophgo@lists.linux.dev>; Sat, 13 Dec 2025 07:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765612515; cv=none; b=rDBmraXQKBC8F3A80Kxox8EpYUXg4kBQtxzth2vEoi6D8S5sIqA10tMHKNTpyv3ySQs4ut8TjZKLiGTfrwwfFCn+sTdxvyV0h0VLrKHXWd2JC/Iys4+v0HlxZ/mIN1zwqQGrAtpZDPsKUZQ6HNhT7uSuxSaCdhVsoRUanEWjNzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765612515; c=relaxed/simple;
	bh=/1Y7ZubKQzIS9Nn9KYozZYf4WuMV9JVNDqL7JrO650Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hHHVJpzgS3qlvjYfNh1w8F8y36YvFH3WEDi/d/8cM1UuVdlMIsg7L+gfERPSZPlTPta2zMqk/DwFtRBNEbALvIRJ+4EyI+els4HQ+789lcQzQsG8MKgMIb39AwTdKkz66d2KpV8ufMqjEttMDZ7cZe0nl6M7wIR7k+C7Gl4Zsag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=EgsMOr3e; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EgsMOr3e"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7b9c17dd591so1650257b3a.3
        for <sophgo@lists.linux.dev>; Fri, 12 Dec 2025 23:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1765612513; x=1766217313; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PSg2TYT9sWOtcESEo56kzWemNLsi4EVpvVRgATHWE1A=;
        b=EgsMOr3eXfV4LLUk4EwxWl39BRlgHg9SgLhn4wibzETLHUXMcFmNi0+gan86yGHOJa
         X2CP3yD05nZit/8XFcjz04nK5AbM8qLUktviboaI1oS0/e4TRzp7ITGitylEQGFIyExe
         FrHjn60XeLCKGshZP3fv5GIbzNIvRMdjygGHX45n/ivw0hJxosGhAhHYwY9cKSXoM8Kc
         7RhTLf9QZdGrVMUiqnGBIiSxtmLzg/aAhLc/DOe+Bjig5fVFVFvESEuzEyzOD7kxlAMs
         zHyG1luCjC7s6ClQE8Pep/lf2ne4CCmchP4vHWi+xo86wEalpgf6RbJ9pFK7LzREfjTM
         R1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765612513; x=1766217313;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSg2TYT9sWOtcESEo56kzWemNLsi4EVpvVRgATHWE1A=;
        b=oW85JxSpPwZtQFWTI3kt+RGxVbY2+K/WyZBd6hdIUZZSH5HGfLBLMhSO6dig53PO65
         2tagjQNW+VKRzPdl1vE/CDVvr4PZprdxKBNq32uefE11GIA3aBHGW2kO5t0rDuirBDWK
         Z5ESeLd/A7NWmSh6eo9TVD5LnDhzYXveDnB61pKzCfCryZ7b7UW2Jwqawa36TXu/imdW
         5TXlZ+6yqgQ0orTfynqOgCrZLlqvQWMfvzHdJiLzWYN8xO02aIoB/NPPsPsz9+gL861+
         fvIUAyD8qO+Kcw8+4zcD7iNk28qqJvyPWLaP4W+7AtnD4biNjYNwi4gEFBVE+bnBNGYk
         /0Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXh3PLwlgb3fih/Ujav4lORSfw8WQ25Zx7VfZyPD3x+J1KKLdiVncOskv/R43CgLB43p6qxIW8=@lists.linux.dev
X-Gm-Message-State: AOJu0YynhpGlShdCVAkQSWsKyyysJjlogr63XgHMa50SEwNUrkgfmx4b
	Qr8/4yGDnD0UiK1x0u9/ztaVRvM6weWpZFrZgju8LA1SXbHnQPNbKHnw7PsBYAl2/ms=
X-Gm-Gg: AY/fxX6yq+ncQsYEDmA8i/c4mu6yk/plQbq9Yn7RvdCFoRp4idPhpIW2TDcLpGpNePB
	2VVMIQ3dl1760PHKEDOiDo0Xi7x3vOXP1vYWOD4fQCiP++OlUW36sVbyvy5RoDmVebn8hmmQs8N
	cxyfchmdqSVQ8JnGlmkkK/E2RQn4Km1aw9nnYOrARPv7MthXQA8AheqcZgl+RpHGITZSVlbSRA4
	y67KXtN3mHe0obcDWijx288DikyCm7TNlEIU3knnq7GrVfw623P/ZjtaBmbK7nZPPIOuYONoj7R
	D96u8wFck+8RXALAK8afndaGzSRcMmUFCNNblVR4x4yvtJRHf4U7KnlrJ2pF12nIbzYsN8qtHx0
	wwMhZaFHKYcNlRRWkWbnlGJfNskWyykPH5uV5v/rnQLdlrTo8m2XpAGQGSl3U17aGrAAhl9CFWY
	EoHVVnIwkuXvs+EbRIn2j8bEOi5wArwQ==
X-Google-Smtp-Source: AGHT+IHOWrUINqZuvftQzED4J6JEOwCF3MwpJCzvYtbDq2TpenTmo8Kz5bbfjFWruq5ev9Hib6L/8Q==
X-Received: by 2002:a05:6a00:1f13:b0:7f6:3f21:7d22 with SMTP id d2e1a72fcca58-7f6693a69e9mr3821365b3a.45.1765612512724;
        Fri, 12 Dec 2025 23:55:12 -0800 (PST)
Received: from [100.64.0.1] ([167.103.29.104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c27733edsm7218185b3a.20.2025.12.12.23.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Dec 2025 23:55:12 -0800 (PST)
Message-ID: <8a3d3db6-6614-42f7-a271-e6188391daf6@sifive.com>
Date: Sat, 13 Dec 2025 16:55:06 +0900
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dmaengine: dw-axi-dmac: Add support for CV1800B DMA
To: Inochi Amaoto <inochiama@gmail.com>
Cc: "Anton D . Stavinskii" <stavinsky@gmail.com>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Longbin Li <looong.bin@gmail.com>, Yixun Lan <dlan@gentoo.org>,
 Ze Huang <huangze@whut.edu.cn>
References: <20251212020504.915616-1-inochiama@gmail.com>
 <20251212020504.915616-3-inochiama@gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20251212020504.915616-3-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Inochi,

On 2025-12-12 11:05 AM, Inochi Amaoto wrote:
> As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
> the SoC provides a dma multiplexer to reuse the DMA channel. However,
> the dma multiplexer also controlls the DMA interrupt multiplexer, which

typo: controls

> means that the dma multiplexer needs to know the channel number.
> 
> Allow the driver to use DMA phandle args as the channel number, so the
> DMA multiplexer can route the DMA interrupt correctly.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 23 ++++++++++++++++---
>  drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
>  2 files changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> index b23536645ff7..62bf0d0dc354 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
> @@ -50,6 +50,7 @@
>  #define AXI_DMA_FLAG_HAS_APB_REGS	BIT(0)
>  #define AXI_DMA_FLAG_HAS_RESETS		BIT(1)
>  #define AXI_DMA_FLAG_USE_CFG2		BIT(2)
> +#define AXI_DMA_FLAG_HANDSHAKE_AS_CHAN	BIT(3)
> 
>  static inline void
>  axi_dma_iowrite32(struct axi_dma_chip *chip, u32 reg, u32 val)
> @@ -1361,15 +1362,26 @@ static struct dma_chan *dw_axi_dma_of_xlate(struct of_phandle_args *dma_spec,
>  					    struct of_dma *ofdma)
>  {
>  	struct dw_axi_dma *dw = ofdma->of_dma_data;
> +	unsigned int handshake = dma_spec->args[0];
>  	struct axi_dma_chan *chan;
>  	struct dma_chan *dchan;
> 
> -	dchan = dma_get_any_slave_channel(&dw->dma);
> +	if (dw->hdata->use_handshake_as_channel_number) {
> +		if (handshake >= dw->hdata->nr_channels)
> +			return NULL;
> +
> +		chan = &dw->chan[handshake];
> +		dchan = dma_get_slave_channel(&chan->vc.chan);
> +	} else {
> +		dchan = dma_get_any_slave_channel(&dw->dma);
> +	}
> +
>  	if (!dchan)
>  		return NULL;
> 
> -	chan = dchan_to_axi_dma_chan(dchan);
> -	chan->hw_handshake_num = dma_spec->args[0];
> +	if (!chan)

When use_handshake_as_channel_number is false, chan is uninitialized here.

Regards,
Samuel

> +		chan = dchan_to_axi_dma_chan(dchan);
> +	chan->hw_handshake_num = handshake;
>  	return dchan;
>  }
> 
> @@ -1508,6 +1520,8 @@ static int dw_probe(struct platform_device *pdev)
>  			return ret;
>  	}
> 
> +	chip->dw->hdata->use_handshake_as_channel_number = !!(flags & AXI_DMA_FLAG_HANDSHAKE_AS_CHAN);
> +
>  	chip->dw->hdata->use_cfg2 = !!(flags & AXI_DMA_FLAG_USE_CFG2);
> 
>  	chip->core_clk = devm_clk_get(chip->dev, "core-clk");
> @@ -1663,6 +1677,9 @@ static const struct of_device_id dw_dma_of_id_table[] = {
>  	}, {
>  		.compatible = "intel,kmb-axi-dma",
>  		.data = (void *)AXI_DMA_FLAG_HAS_APB_REGS,
> +	}, {
> +		.compatible = "sophgo,cv1800b-axi-dma",
> +		.data = (void *)AXI_DMA_FLAG_HANDSHAKE_AS_CHAN,
>  	}, {
>  		.compatible = "starfive,jh7110-axi-dma",
>  		.data = (void *)(AXI_DMA_FLAG_HAS_RESETS | AXI_DMA_FLAG_USE_CFG2),
> diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> index b842e6a8d90d..67cc199e24d1 100644
> --- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> +++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
> @@ -34,6 +34,7 @@ struct dw_axi_dma_hcfg {
>  	bool	reg_map_8_channels;
>  	bool	restrict_axi_burst_len;
>  	bool	use_cfg2;
> +	bool	use_handshake_as_channel_number;
>  };
> 
>  struct axi_dma_chan {
> --
> 2.52.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

