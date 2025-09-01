Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF42188715
	for <sophgo@lists.linux.dev>; Mon,  1 Sep 2025 22:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756764985; cv=none; b=prw/mqdtqInR4cYPPr8YYUIY684gc0sVJIRa0ZGpisvakAuNTlmkXpZaWUqBwRzfiXzSuYd4Bz6cXN3buT0Q6yC4hHUnbmEuzj3FI84WCsXe+WhS5szgsjAkOc46Y9ZJcM3sHfxJK0aImdrfiOO5LhB5JVLJueXLbubn8yOlzjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756764985; c=relaxed/simple;
	bh=oLskMqaHBZDQ4M+92Ea6fkMbA16LtpzZszxWHw36BKk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjHMINJ+8IX9dQSBVnZvLH+GfccdbdGug2C2syvd6y41EIpDH27B11yXvM9rNP5UvhvJp3suoI0FYnPXtRwQ/JSq4JvQOT8mlCc5KLRP8LjsVAOJvV1xmmg9emMpV2s3sAhHuHRkVkMmjVqQ2mMR9l3VAjJdp8KonVkayi32voc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKisifqt; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKisifqt"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-772627dd50aso992744b3a.1
        for <sophgo@lists.linux.dev>; Mon, 01 Sep 2025 15:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756764983; x=1757369783; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=erf0LGr1RXc9Ic0frfV15S6ddZ5bAby40+1+C+q1TDE=;
        b=UKisifqtha2n0NcKxOi0DjpfVcpyc9u9Nw9AAcmrS5/8cO03o65NBlKlN+fvBfeYDM
         43QBh+jGbiaO9n8LyVTpJb0TCLNRO+JuJgXD/m3yCaKq0HV+uGTwTS0VuL/6P1fxgRi4
         vexWr+mHb3KCKBithKtau0ZsvojBaVUdNf/8KokzCmNOO7APPded2FJT0iKetmOTohD6
         w/miJCQywXRFvtU4EyiljVxdpKTDdhB9YXF+rJuiMn3XaZZ85frtUE5TpwuhcHth8F/F
         tiAmyh/PYJ5MOLKjmVC+kvQ9KNACFiRXmFhZQWZRZb+OYygDiokv9JW0+yVXwy6+7uoP
         1BKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756764983; x=1757369783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erf0LGr1RXc9Ic0frfV15S6ddZ5bAby40+1+C+q1TDE=;
        b=iMyAPMHnh2Whrlq3cXg44tUWdOTXLs0OAV0rW8XPDtHCcOugjKqcgI4pFS2+Nav9qE
         thr83KFtbBvAM9KhtYNQbocp0d4+aTejYt+N+iUrx7gbtNUW7ET45ud0Uk6hK+CJGYZR
         IYFevb2HA18IKeOF1OzNRHG5P9rzpEeKDfwRekTEnsqA9tLku7mg3PXN9bmByAJdQPsV
         D9TZyWnbYrJg7G/IRp3jiN6QXAlZY3l5RBtv2XJaJrm93/oi1xEk55jycOltW+tqVrd3
         ZgJ8rUqta1tYwpP7DowyVD/W8RNlz45Zt6HKCYS+NPXLZE00HNu3i6JP8V1nDvmkZ4Mi
         bbHw==
X-Forwarded-Encrypted: i=1; AJvYcCVDA4RmMnTIN0MkC8IpxgJWps0or3PHUP4BWfczot7M97DGLLqRYJLb5eN5kgUvPOkQlk99PVk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwvwOY9pssO1eor5R3MJF7JJEMVuUEigoYiz/XpmON4JK0HZpr2
	H+UaQOgdFftb/y+D7ItyrVEmHaYxj0zwHp4iBvPDDJS8IaR2oS/K8cee
X-Gm-Gg: ASbGncscANRKY9Ei710haMNRL88oJiJ/F/KUBX3S+ZTgwx0oIrWIF1puCoStI3/UhM4
	FgWiN38Uoc1moSIA6pISVgi8aNxcN2szpJB3ghmncOG70s030nWbk0+wqco3AN1SWEiSEdcm+Dk
	SUc02Fl3DSuuBZ8E/OzJyRP3stHC2TQph5dITIGsr4OJ9B54bixkIpQvZyOUvx7grpXi4yMpOn0
	OXIa7NX3U0kvKunhNydb35b/u8Bu4OMlAdGE7mF2NP98EN3jMpPwVSppBz4DsQ+ItUW1XVLNYse
	5D7WwSXJZG9z7mEbulBA2mVhY6aTMMH8v9oRKOEJ4+Lr9753c6usMWs6JpU70t4vFYdwG5jy4Tp
	Bro+gglcAnTacbosJ1Riarw==
X-Google-Smtp-Source: AGHT+IFWF0I/dXBzxrh9+lgnjxp+4hm9yfWG/1QG0n322Ke/LdJEyJO54HHlRnJIo9PFXfBtS2k73w==
X-Received: by 2002:a05:6a20:7490:b0:243:7379:53a9 with SMTP id adf61e73a8af0-243d50948b2mr13602559637.9.1756764982262;
        Mon, 01 Sep 2025 15:16:22 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b4e7989b53dsm7071350a12.29.2025.09.01.15.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 15:16:21 -0700 (PDT)
Date: Tue, 2 Sep 2025 06:16:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com, 
	aou@eecs.berkeley.edu, unicorn_wang@outlook.com, conor+dt@kernel.org, 
	inochiama@gmail.com, krzk+dt@kernel.org, looong.bin@gmail.com, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh@kernel.org, tglx@linutronix.de, sycamoremoon376@gmail.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev
Subject: Re: [PATCH v2 0/3] irqchip/sg2042-msi: Set irq type according to DT
 configuration
Message-ID: <k3blxflvwicykiqv4eo6hx2notcp76rdf72oe37wkkkcq4ookr@fyydrsjv3r6z>
References: <cover.1756169460.git.unicorn_wang@outlook.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1756169460.git.unicorn_wang@outlook.com>

On Tue, Aug 26, 2025 at 09:09:13AM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> The original MSI interrupt type was hard-coded, which was not a good idea.
> Now it is changed to read the device tree configuration and then set the
> interrupt type.
> 
> This patchset is based on irq/drivers branch of tip.
> 
> ---
> 
> Changes in v2:
>   The patch series is based on irq/drivers branch of tip.
> 
>   Reverted the change to obtain params of "msi-ranges"; it's better not to
>   assume the value of "#interrupt-cells" is 2, even though it's known to be
>   the case. Thanks to Inochi for the comments.
> 
> Changes in v1:
>   The patch series is based on irq/drivers branch of tip. You can simply review
>   or test the patches at the link [1].
> 
> Link: https://lore.kernel.org/linux-riscv/cover.1756103516.git.unicorn_wang@outlook.com/ [1]
> ---
> 
> Chen Wang (3):
>   irqchip/sg2042-msi: Set irq type according to DT configuration
>   riscv: sophgo: dts: sg2042: change msi irq type to
>     IRQ_TYPE_EDGE_RISING
>   riscv: sophgo: dts: sg2044: change msi irq type to
>     IRQ_TYPE_EDGE_RISING
> 
>  arch/riscv/boot/dts/sophgo/sg2042.dtsi | 2 +-
>  arch/riscv/boot/dts/sophgo/sg2044.dtsi | 2 +-
>  drivers/irqchip/irq-sg2042-msi.c       | 7 +++++--
>  3 files changed, 7 insertions(+), 4 deletions(-)
> 
> 
> base-commit: 8ff1c16c753e293c3ba20583cb64f81ea7b9a451
> -- 
> 2.34.1
> 

Tested-by: Inochi Amaoto <inochiama@gmail.com> # Sophgo SRD3-10
