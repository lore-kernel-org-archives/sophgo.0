Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324083B38B9
	for <sophgo@lists.linux.dev>; Tue,  2 Jun 2026 08:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780388544; cv=none; b=ZAJMIevpmsM01wxc5WQhPYJuhD2Uxg6Hv1blRFmJMsNPjFC9flQdSbJhSc3TwHEZM9fVR2cA0+NJ/kZG/EUf66/lDO1B5Lt2OydUx+TQcWdQzEA/HTIXlrATJnDLOb5mf67YQhsGGJt2kY/ctIsSkqECHcbx/BmDCibbYRYkS4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780388544; c=relaxed/simple;
	bh=EJikaUMJCTIOu24FQfnsiP8Ha+Alj5V2JdWUXPbDzPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fO4X0fTbiehw6CbA1gXF8NwhXhthllHkFU0nRer9F1lMuXfcA/G5qHpJ1L4LLojkRfMudGnLuyZ7liUfCETgKMOPPuHNXWjuEU1QA/aqOYkp1iSk4qbI+pwcOvBa/3fHNp0wIn4UKqvIqZ6Gcuteu5w2uEKaNvRhfXyZ6H2g40s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYLHwhdv; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYLHwhdv"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36b7b7b7a80so2477447a91.1
        for <sophgo@lists.linux.dev>; Tue, 02 Jun 2026 01:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780388541; x=1780993341; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=evjuzAv8DSTdE0Ve2B6VtbgLhoX9BoKz8McLMZToRaA=;
        b=dYLHwhdvz/I5l8VdHn5TCSnmLQdFpvbhe2clWBOjjKGOnmr/HXP/0W9f61u1FsoEiJ
         A7pwA4UrlI9dfiatyoE4YmrsNXn6pncO/BgNMcliKWwjwkSIMvLyKVGn2VVZ5soor1gd
         wryEwt5wOsyAL/VCpNGo/CqLXqA2u4XIsbSnGRz+493zqh2UCFmfs8HFZNtbiSvRYwRB
         juOC7FMdmB8wlK6tl5jvUWBYCES7NChnVGMlg5SrDroE2mlw8/q/3LqYBt6XV5gofnS7
         O1m6qYGx6nlLXX/LNICckJmJFGY6Nax1EwYatab4vGFOAnEJT9EObdn7/pRlvCQdxDOs
         Nscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780388541; x=1780993341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evjuzAv8DSTdE0Ve2B6VtbgLhoX9BoKz8McLMZToRaA=;
        b=oE/mZBm8nUccr52MuAaaILSkEgXH076CKdh4Hrdc9jWus/Az/MJ78OSb605idaL5NR
         NyiptnK7+IyiG2qJt/r3Ak8PTkIvIlyqXC49H/i+kPyAeWSdpnOmSwDObJvq/ABnIpKu
         kFg3ggl3sg+zRygTU93RPIJnJazJ+8HnhBPxOqmQXvvtg+XErFsrpXKfvwvZ6M/xcP+C
         i8NUB4lTufko8rUsRXCamocqFCcwcVVk1UbW7plaYBbq1VSFBCSqRnQN4l9VG4mZN0GQ
         ZUnFZrRhhzB4auXU2oiaOnpEwlDhcO3V4Ic3pQIz1cbYR2+kdPBzaCaoSJ3QGWqxsk8u
         2ujw==
X-Forwarded-Encrypted: i=1; AFNElJ/wIFJg88IoKcSlivxijejDaOV2EeLs4rWZXDfp525V1jZ8FX8eFOrn/6jzobwjrYn0FzlWPHU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7YBknmZR9O/atFzHODZtjB2J9AfMMMepeEB5/YFYmUHo32uqZ
	NhUZbDrbZDjmmQ74dBdV0SzBayJYlnbxIOFD8dvbZk1SxPqGGcTw3k0b
X-Gm-Gg: Acq92OF7aweQXYrh/FTTTN6CY6F2dFc6WrIVj/jVxctws5QGo7bAnttnjFBtaNby6UU
	3TlkQIoyAZ6GsjcIgfLmZ+6ISvWHB6+dBMlHTi8kCKyq1RKC8FYInyNLHe6+d4oxNAwgSP6JbMw
	79eTnFp/qev7PZVPqkyuDJXMvVA+7QoDZoVh4TrEEd8SWiXaa6XfpKzr+2blVhm3gJBJ5/J5DNE
	svowc4xHtPeCiz3Fa6ldwuu1Ab2aEWwrL2XxXkxzP4DscgQzFV1wRsa3IcdxZjpKRSh6925yeai
	rw/kbERuK9DjilQU4Aw/sIkWlEfXOjm5hL313h6WavnDbgpSIdkGV6hzwAuptybsoJ2lVxoaKo4
	yAr/aRVB6mpgQ4bamq6ldPuoKxtL0di+w2kDORXKD+I0CvmHyIflSxpXEIpQrQUs6oKYOffhK8b
	Dvd3Pg1EiLCSm/voI3HZb9GnUHTK7JciIsRQ==
X-Received: by 2002:a17:90a:d006:b0:36a:caf2:3815 with SMTP id 98e67ed59e1d1-36dd98883ebmr2740656a91.15.1780388541458;
        Tue, 02 Jun 2026 01:22:21 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd931ab67sm1864181a91.16.2026.06.02.01.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 01:22:20 -0700 (PDT)
Date: Tue, 2 Jun 2026 16:22:02 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com, 
	unicorn_wang@outlook.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, 
	dlan@kernel.org, chao.wei@sophgo.com, anup@brainfault.org, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Joshua Milas <josh.milas@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	hanguidong02@gmail.com, michael.opdenacker@rootcommit.com
Subject: Re: (subset) [PATCH v5 RESEND 0/5] Add initial Milk-V Duo S board
 support
Message-ID: <ah6Se6TJM-wS8UVP@inochi.infowork>
References: <20260530173347.33533-1-josh.milas@gmail.com>
 <178038833103.2088679.3632311874557644565.b4-ty@b4>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178038833103.2088679.3632311874557644565.b4-ty@b4>

On Tue, Jun 02, 2026 at 04:19:05PM +0800, Inochi Amaoto wrote:
> On Sat, 30 May 2026 13:33:42 -0400, Joshua Milas wrote:
> > This adds an initial device tree for the Milk-V Duo S board
> > with support for reading from the SD card and network over
> > Ethernet. This is continued work from Michael Opdenacker's
> > v6 series [1] on the ARM64 and RISCV side. It has been tested
> > with ARM64 and RISCV64 to boot from an SD card, have networking,
> > and read I2C slave devices over i2c4.
> > 
> > [...]
> 
> Applied to for-next, thanks!
> 
> [1/5] dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
>       https://github.com/sophgo/linux/commit/eeec80c3ce36ead24e2f53d88a24dac1e3de8041
> [4/5] riscv64: dts: sophgo: add SG2000 dtsi
>       https://github.com/sophgo/linux/commit/2145cd2f0082c11177b062e1ecbce121c3b50b43
> 
> Thanks,
> Inochi
> 

Please ignore this, I apply the wrong patch, A new thanks will be sent 
after I fix this. Sorry for the noise.

Regards,
Inochi
