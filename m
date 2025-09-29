Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0B21DA61B
	for <sophgo@lists.linux.dev>; Mon, 29 Sep 2025 23:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759189574; cv=none; b=McEnKavHjrQcHbuK3FDnnozxsElLJ4uaBEnaZF3Xa0CYjtyub+ghpDiCbDwgKFPvG/BGztsA/4WpI4E9rICKiuSkiolb/BOu5dA+yUTRyimXoaJnmWHhtx1i43v0aU1S5HTI1q5NGp7XWxO83LTYocI/WV0kpKqv4Kuvxc+K558=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759189574; c=relaxed/simple;
	bh=yCyCG57xZaWUoZz7E4FksWbaolrWtwsc6M+eqcEYvOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=taifdZUnWycM3eVX2J1tRKiU40AKwSjz273Zdv1WRCyhUZe+9BQNcx1y+SQzpeFtQJfZ5HMsA6GN/4MLk9424VJHQ5Xs9BcxHg/kpGjdbSUnV2LeiJGbl9VGt9GreSow7VAmyhg9vtoCSho92clBV6neeF8ylW1Lx/bEvpDFhIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAgsHho+; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAgsHho+"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3324523dfb2so5060802a91.0
        for <sophgo@lists.linux.dev>; Mon, 29 Sep 2025 16:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759189572; x=1759794372; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bO+PpllHTATyLZ4i6dwO2dpUo4lzbDmt26PaKTNvZeo=;
        b=lAgsHho+rIclBAVMWyl0c+Oj7bIsJ2rWSaJH6RlUx3A4VPg7m5l0H8ICkFCaDDmwWt
         7So7C9AbmEn8R5iG582Y/NHWxDQ3jxs4kLn/mik5U5YLFh2dn1g1ud8trGdb8EqQTfEk
         G+7LDpTuutldI6HuG8H8FijpuRy2yBV9agv86tsvP68v/s210p0vy6JVm93vvqLxfh+X
         lcIIE721mRqXnIjyQBxwR9NZxivr0XaAza+DL6OyreMOhak9DfMEDn9fRTdC1jlJk/KB
         rMU9FucZNfXI0VppNH85dCWwoyrhi6VIqecrknLtQhYq9qyHRXGEsEIaxKTqvG590D0B
         m3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759189572; x=1759794372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bO+PpllHTATyLZ4i6dwO2dpUo4lzbDmt26PaKTNvZeo=;
        b=mEh2F4OAyAajEEHG3PoTCymQbRio4+poURceyizGYSe1evmDtKC6KHGj2Fbwvya/av
         CMF15Yf55DzKgW1956szwm2+Db/nwU0SPmcHhfSd7UWyY5/7aioxDhO8SqniRdbLgZjO
         iN12Z5N9XAt9RuUMLADBwIooNMhn/h3qMqK8+xgrXYFKUnqDkwSkpFEx7t0gu+1Bzreu
         PNe3SB93mClUC9aUqrcZRfYlWAVAkIkUvMAQGL2LHWTcB+CPh2UrchoHTKVzW+DrTpVX
         NqPD4C9M/5pKMJ8JTuLU8oXLvTr7pj6dnf2Im4/kHzbRz1cu6nNFpI57Fh33Xm7E5nym
         bysQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTj8wvWQY5UlE5OkpRbdFD+5wrGz3HmQ3f76BcUF6hGCOVe6ETnQWAs4D+4ObF/nYNtkvEcPc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyURi3cgqMfN3QsIKxLGLmylJAqlisnBwxD+BTPzE0Y0ao18o9U
	GS/dU18SkSpDyaPMHmy1IzANkJdK3hvknrNNKNrct8LxXSVgspn2KbFC
X-Gm-Gg: ASbGnctoknWu81Qnm85VhBSY9wFIf0+oI3pLxjWL5SGXl3FRe1uYLNEhbYzY+20ESra
	nxEkASpotcITOzS/Iq97d7E0KPFXjMQ9NXOLa3U5SdMb6L40rRgBn4i83kCjKTu3lFHmS5QpQD3
	iQLf56Snr2SnbfkXCWcRPo6TiqiZMOb7Lg37v6KM+kpse8sPf9yyD9dQqZSKyNffPrJou9Hbca4
	4UuWd1IQtYm0hAHXiUdqS/9WGkoHtVN2yFUaxCEJs8wcrO3VUNCr5qOQTW1iFC/DP3pmDPyx9mu
	VvG6+MpUxa9vG/Sf6HCE+p4q3qNhXyZA/7ddr4+tFQQxUFtNdY+Zcukg5N+e0JtfzHF3ESKRra4
	hv2VLNpAw2xKDJdXFKf/Q6LYqm4lxlXPxxh1kDyp7G19k9VgWyvhw1ONV
X-Google-Smtp-Source: AGHT+IHzqz6HK8/GqG4J4SA0G21SOGM3r5qfIFvJmRO7QQbYF4xlSA1UfHOox4bOXdX7rOJ+v5M5JQ==
X-Received: by 2002:a17:90b:5109:b0:330:9fe7:b014 with SMTP id 98e67ed59e1d1-3342a2ebce9mr17126123a91.31.1759189572135;
        Mon, 29 Sep 2025 16:46:12 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3383863e7c6sm2503336a91.0.2025.09.29.16.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 16:46:11 -0700 (PDT)
Date: Tue, 30 Sep 2025 07:45:43 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: E Shattow <e@freeshell.de>, Joshua Milas <josh.milas@gmail.com>, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	unicorn_wang@outlook.com, inochiama@gmail.com, alexander.sverdlin@gmail.com, 
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com, chao.wei@sophgo.com
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <syyzru6xk2m4y4xgsami5ppvcvsspdigqt4czj77ruxzep5sgf@cvlgglxsrrjb>
References: <20250927173619.89768-1-josh.milas@gmail.com>
 <20250927173619.89768-3-josh.milas@gmail.com>
 <0f581625-24d8-4b91-8935-685a837ea217@freeshell.de>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f581625-24d8-4b91-8935-685a837ea217@freeshell.de>

On Sat, Sep 27, 2025 at 09:09:30PM -0700, E Shattow wrote:
> Hi Joshua,
> 
> On 9/27/25 10:36, Joshua Milas wrote:
> > This adds initial arm64 support for the Milk-V Duo S board
> > (https://milkv.io/duo-s), enabling the serial port and sdhci0,
> > making it possible to boot Linux to the command line.
> >
> > Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> > ---
> >  arch/arm64/boot/dts/sophgo/Makefile           |  1 +
> >  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 88 +++++++++++++++++++
> >  2 files changed, 89 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> >
> > diff --git a/arch/arm64/boot/dts/sophgo/Makefile
> b/arch/arm64/boot/dts/sophgo/Makefile
> > index 94f52cd7d994..68aace728223 100644
> > --- a/arch/arm64/boot/dts/sophgo/Makefile
> > +++ b/arch/arm64/boot/dts/sophgo/Makefile
> > @@ -1,2 +1,3 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
> > +dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
> > diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> > new file mode 100644
> > index 000000000000..94cf89d423de
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> > @@ -0,0 +1,88 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
> > +#include "sg2000.dtsi"
> > +
> > +/ {
> > +	model = "Milk-V DuoS";
> > +	compatible = "milkv,duo-s", "sophgo,sg2000";
> "Milk-V Duo S" with "milkv,duo-s, "sophgo,sg2000"
> 

I prefer this one.

> or
> 
> "Milk-V Duo S" with milkv,duos, "sophgo,sg2000"
> 
> and dts filename to agree.
> 
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +		mmc0 = &sdhci0;
> > +	};
> Sort aliases.
> 
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +	};
> > +};
> > +
> > +&osc {
> > +	clock-frequency = <25000000>;
> > +};
> > +
> > +&pinctrl {
> > +	sdhci0_cfg: sdhci0-cfg {
> > +		sdhci0-cd-pins {
> > +			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
> > +			bias-pull-up;
> > +			drive-strength-microamp = <10800>;
> > +			power-source = <3300>;
> > +		};
> > +
> > +		sdhci0-clk-pins {
> > +			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
> > +			bias-pull-up;
> > +			drive-strength-microamp = <16100>;
> > +			power-source = <3300>;
> > +		};
> > +
> > +		sdhci0-cmd-pins {
> > +			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
> > +			bias-pull-up;
> > +			drive-strength-microamp = <10800>;
> > +			power-source = <3300>;
> > +		};
> > +
> > +		sdhci0-data-pins {
> > +			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
> > +				 <PINMUX(PIN_SD0_D1, 0)>,
> > +				 <PINMUX(PIN_SD0_D2, 0)>,
> > +				 <PINMUX(PIN_SD0_D3, 0)>;
> > +			bias-pull-up;
> > +			drive-strength-microamp = <10800>;
> > +			power-source = <3300>;
> > +		};
> > +	};
> > +
> > +	uart0_cfg: uart0-cfg {
> > +		uart0-pins {
> > +			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> > +				 <PINMUX(PIN_UART0_RX, 0)>;
> > +			bias-pull-up;
> > +			drive-strength-microamp = <10800>;
> > +			power-source = <3300>;
> > +		};
> > +	};
> > +};
> > +
> > +&uart0 {
> > +	pinctrl-0 = <&uart0_cfg>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +	/delete-property/ resets;
> > +};
> Needs parting of resets out from where it is now instead of
> delete-property here. I don't know if that can be the same series.
> 
> > +
> > +&sdhci0 {
> > +	bus-width = <4>;
> > +	no-1-8-v;
> > +	no-mmc;
> > +	no-sdio;
> Unlikely to need 'no-mmc' 'no-sdio'. Test without, and drop?
> 
> > +	disable-wp;
> > +	pinctrl-0 = <&sdhci0_cfg>;
> > +	pinctrl-names = "default";
> > +	status = "okay";
> > +};
> > +
> Please use '--base=' with git format-patch so we will know the commit id
> your series is based from.
> 
> Best regards,
> 
> -E Shattow
