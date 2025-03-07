Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8163F1AD41F
	for <sophgo@lists.linux.dev>; Fri,  7 Mar 2025 06:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741328727; cv=none; b=LP+4hMi/56cMs2VR+tNF8tzayae13i8qrmzUdBBjlVll2gnrszoqdQrkBUOLJhry7JVdGgbcUmyDShrb7729hHorJjOYXLRkyEzlp2do9C3RWIbSFI3zX7WJZMso3c8p2pmtKBxkJWAQV9/r5no/PeF1OTRkgmPhKDKy++oqwXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741328727; c=relaxed/simple;
	bh=IaXFjppS/IoB+IJ+M/BVXjFLMyZOrjULwzmXC5Zs3oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sjqq3W2KNyG+nw/1ok3nIXc08vvqlnA56TlB/fb2Q4v37a4q8Rd1kCMdLPA0WK0q0+JZhu8Y37k4TcjbOZXp7ZSjIpigSl8QeHhnxpiqYsddY/xIR78RglkL2wkSTc4sivVUBMXxMaMGcFb/zNo23Pxtox/4aZ5vJN6fpd+2K7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWgljpGj; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWgljpGj"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7be8f281714so170478585a.1
        for <sophgo@lists.linux.dev>; Thu, 06 Mar 2025 22:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741328724; x=1741933524; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DE4RgttB+ObeTGoRY2FNPNi0ZuWCnd0LsJTM8WKCSPE=;
        b=WWgljpGj3oW8VtXDdp9yZ88kf7WOUosNwcMgfB3I+2FzTNhGmIO+9OYgaH4j29OkTY
         K2eZlwhkekp4w7tFthpJkKdNHvxlUWwL+MVeQia+ox9OMmRVCOr9sU95b3hPn/2ph4oY
         c4VUa7dfXvP7zSJfEB0aqD3t/qAaMcFn9c4AxW9c/b90o56Fnj5R46DcGJG6Qy65970N
         8I92VgIexZC+/baLlc3avCXjS1mRQIWqqsNZJXWY06uKcFPcxG2N2Y4UQSu+t0ghLxFa
         xeH/QvCtDQ0zQ8ip/mgw2tW12iuRKrmBwzZtUdfPEx/g/km0wdfghf0N9DTjRiBGCrcd
         PvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741328724; x=1741933524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DE4RgttB+ObeTGoRY2FNPNi0ZuWCnd0LsJTM8WKCSPE=;
        b=kwlyyi7MdQ/gWxErdXC5LnzhvDkg55QzTxzN04VUSj2y3PSH9Qs9pdf4knL0CyPM5m
         NeCcxqjH6WpWvA66SM4Y81A2tpl3OUfWVZqyoTP5dvT+Du7BjjCpy+qBMLBUji5Bf+X3
         Agd2AKz8WoHOdTdFJ8cA9KNAcS+lW+kgPb5fRo9BfvMqttsBRlcKpFy0eF89P5/vGZCp
         6MihWhE+Tx9mN/XBvet1MVRuJzibk8ox9NbtpALds7HGsF9XBPnkRfqhvrRGuoilmM6B
         A+zlaFWmN9YmMCpFvesPra/RXNutdC3BvmXpAYvXDHwdOB+Kb4LXwVeGgSs161FutK0W
         O8jA==
X-Forwarded-Encrypted: i=1; AJvYcCV9DHwaMsTBGbuUQenggISqIDPwJRsu6mhXk6xp9K9LwuD6CwCI7fJyYpYj4g6NEsIl0jerOfo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxeCfTwmsW+dxaIURkCco5Xzlw9jwYLRn/cW7NPkts7aR2rHrSK
	e6INV/ll0GcgSloRKCfCG4AT/H2sFXLX1eeoGD6Ek/lKuGY357mp
X-Gm-Gg: ASbGncsXC5o7u5qYnFyCrXIjWhzF1T4jTOORNMI/i0p9tInYaH03idBJvkW9FxtK82d
	ueQ/87BBfeoODrzlytJ8+tJBvFpLZrfk6pyFWdZ+weZx7QNDwJ31dyj+Ux7JJmQGTPyUPVeoy6l
	T7GWX4ii6OaUXtQ4Vmd6yqaYcQRoBIw6pL7Htbej473f18BUpbck7eq4M7FPQlcyoYdBsTeo3MJ
	VhxSMAFJetgxzEYJrC31JP25+/fu/UytJxKfayhfaQWDlEanWxKamBJ7K/Yyc242HrVciM6xEhJ
	yc4YQL7Lwb/BnY3b4m0v
X-Google-Smtp-Source: AGHT+IEvDoykmlC42OAIJsi/QLfT+x2fU7js07z1lL9fYKp71NWDuSXyrrw0QsqRokKnLcIZ4rtbYA==
X-Received: by 2002:a05:620a:2787:b0:7c3:c199:c3b0 with SMTP id af79cd13be357-7c4e610578fmr376275485a.32.1741328724151;
        Thu, 06 Mar 2025 22:25:24 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3e533a0e8sm200339585a.9.2025.03.06.22.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 22:25:23 -0800 (PST)
Date: Fri, 7 Mar 2025 14:25:19 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v3 0/2] clk: sophgo: add SG2044 clock controller support
Message-ID: <gyww3drj2eez2bl3y5ikxy7mqpqpif7cktd3espqs4ve5srjpk@u6h5nzmtkmrb>
References: <20250226232320.93791-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226232320.93791-1-inochiama@gmail.com>

On Thu, Feb 27, 2025 at 07:23:17AM +0800, Inochi Amaoto wrote:
> The clock controller of SG2044 provides multiple clocks for various
> IPs on the SoC, including PLL, mux, div and gates. As the PLL and
> div have obvious changed and do not fit the framework of SG2042,
> a new implement is provided to handle these.
> 
> Changed from v2:
> 1. Applied Chen Wang' tag
> 2. patch 2: fix author mail infomation
> 
> Changed from v1:
> 1. patch 1: Applied Krzysztof's tag
> 2. patch 2: Fix the build warning from bot.
> 
> Inochi Amaoto (2):
>   dt-bindings: clock: sophgo: add clock controller for SG2044
>   clk: sophgo: Add clock controller support for SG2044 SoC
> 
>  .../bindings/clock/sophgo,sg2044-clk.yaml     |   40 +
>  drivers/clk/sophgo/Kconfig                    |   11 +
>  drivers/clk/sophgo/Makefile                   |    1 +
>  drivers/clk/sophgo/clk-sg2044.c               | 2271 +++++++++++++++++
>  drivers/clk/sophgo/clk-sg2044.h               |   62 +
>  include/dt-bindings/clock/sophgo,sg2044-clk.h |  170 ++
>  6 files changed, 2555 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml
>  create mode 100644 drivers/clk/sophgo/clk-sg2044.c
>  create mode 100644 drivers/clk/sophgo/clk-sg2044.h
>  create mode 100644 include/dt-bindings/clock/sophgo,sg2044-clk.h
> 
> --
> 2.48.1
> 

If there is no comments anymore, I will collect these patch and send
a PR to Stephen at rc6 to see whether he will accept it.

Regards,
Inochi
