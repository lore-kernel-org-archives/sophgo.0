Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1091F5821
	for <sophgo@lists.linux.dev>; Thu, 13 Mar 2025 22:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741905995; cv=none; b=URkZVxKY19yJ+sVIpwJ1L/EWhLbB9P0SbF93R8DozvfsGTHa54nfDzVJIov8+vXnG4u+Ev/ihDJIsR6gjlGeXfYfojHhHXXDRY2Oq37BTSWQUdjFhs8hHuSIupLf3hmyL0fAuHnh/3rmIGP4cLuPbR/do0Z6NJ1J74Q2paTlAwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741905995; c=relaxed/simple;
	bh=QOeWgJa3zFHIM7eilY1J0Y00uN0Q8k5nTUHUnDWrk3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hdyH8tHFfyBJGVvBDWrHOoDFGQBmJugPOlBOe71jw319RcdaDfZPN0UMVEDGdkJlGML3zd5qQPzKx2Lq5C5m0voxTNCvC6GvYCq4e4fUCOFMIdKPUr3Ej8jjed1f909RP43iVu4DNLV3uc0InDIffg4anjQ1kQRAY2A0LqiADA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSclR+6z; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSclR+6z"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6e86b92d3b0so13470676d6.2
        for <sophgo@lists.linux.dev>; Thu, 13 Mar 2025 15:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741905992; x=1742510792; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pydKdgNblpGj5h7sZOGmI2zMsvih3t2v6u7UCPYQDt4=;
        b=eSclR+6z7ZdI5Oo2Wry0wVFjelP77SD9wI+ywyxoKuBP6n/XXa28Zxb2qyvaEwlTkQ
         JsOjfCg+WIWphamqcTM9jRgxgtTwwgV9Ca/M8cPUMxOcu7yKleZjr6bCuPOCiBFYUEYJ
         EPWhW8WTm7AL4Z1t+Zefr2VgDc6hh08cN/3TQjCNXlHhQCMoMa4WKVkvwuu5A6w34Sjo
         fWW+ZH9v0uK/RIBaGbObtW19hMpQERly5JGXlSfQm8DnwP9VTI3FZluhFB6aL41LXQcs
         /GGvBhNx06xmMXjIvw+RfEhKo63jlnJAWtSK75yOQ8adyUfCSmkYV/Jxl5UQmxdQxJUL
         +Pxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741905992; x=1742510792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pydKdgNblpGj5h7sZOGmI2zMsvih3t2v6u7UCPYQDt4=;
        b=ZGWG609PEsdsQaR4bsKvESAGFQJpfofHe5i5pdIAOWho0EEwXIl3vGRSqoo4PbM24y
         LX9+g++E3sK7AC8rQ6oFj2LwMOpRr5wrpYDkr3gnwVefc7GI9g/mrThYrIflLIn2cra6
         t4CClXuy7qidcJQzcrvRof9coPpOd0pzwneAvu7Co+kV1RBJqGeQNtLtqwQFIykBZ0PF
         12E3Aqai+ku/ZjEssmmdqZ07OGPCkSkgL0ao527vfuTZ+Zbr2RVnrKnqD2D2CIKsp/o1
         dgb1ZyThCh37v6IfKFo6mY6KDHsgsbLG/r8n9lTm0HgHxrRO8bGk/jkZ703z6bsXvw1K
         MZ2w==
X-Forwarded-Encrypted: i=1; AJvYcCVNViANx+YQC6crI4Bzd6j+ZlGJoRH2rdoWzBBIgt7C7FyORyEAC8nUsd95UdzR/VLkaPD16pw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yydog2WSUWSPZHEi7wZIk22wKXMC720dbQWz6Orb7RHFMm6mhK0
	6WSg7eYssQK6IMNnOGRde4vVHRLrlDU5KLCDNAbz/vOn1L1NRQxP
X-Gm-Gg: ASbGnctOwn6zu32vCMEYc/X/Lko1wYcL2SaSeYbbjJwq/i+pKqj1H86WtCPge529oM+
	/15jmcOupOzutLKQFGwhkHWf6DkGUc2XYi7imRZZjNo+16L6FzzmM2EJS+GZsqiGSS4RjalGSmu
	xUznTAqx9ftBwa1br62dHe9u/KCF2w5wjBKuoq/jQ44+oIjr+dDbpzl9JT8xDvs/HXCqgiWGXrg
	b1OO0eQLtkIhwx8fCjjspjDjCUVD/9CclgDnobM0tVm/6OE766dOC5oP3R7MIPpDqHOnL+qdU36
	suHmPLb8FJTPRCfZbQ5+
X-Google-Smtp-Source: AGHT+IFqkOHBtuKsF1XowHyy1ib8FDyL6+pkzITiQkL+N8KWE76/yTSNJDscUTJ0dRbwpaXJOoTbcg==
X-Received: by 2002:a05:6214:4009:b0:6e8:f3b0:fa33 with SMTP id 6a1803df08f44-6eaea9ed9e0mr3028786d6.8.1741905992624;
        Thu, 13 Mar 2025 15:46:32 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6eade208e6bsm14898746d6.1.2025.03.13.15.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 15:46:32 -0700 (PDT)
Date: Fri, 14 Mar 2025 06:46:22 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: sophgo: add clock controller
 for SG2044
Message-ID: <txuujicelz5kbcnn3qyihwaspqrdc42z4kmijpwftkxlbofg2w@jsqmwj4lz662>
References: <20250226232320.93791-1-inochiama@gmail.com>
 <20250226232320.93791-2-inochiama@gmail.com>
 <2c00c1fba1cd8115205efe265b7f1926.sboyd@kernel.org>
 <epnv7fp3s3osyxbqa6tpgbuxdcowahda6wwvflnip65tjysjig@3at3yqp2o3vp>
 <f1d5dc9b8f59b00fa21e8f9f2ac3794b.sboyd@kernel.org>
 <x43v3wn5rp2mkhmmmyjvdo7aov4l7hnus34wjw7snd2zbtzrbh@r5wrvn3kxxwv>
 <b816b3d1f11b4cc2ac3fa563fe5f4784.sboyd@kernel.org>
 <nxvuxo7lsljsir24brvghblk2xlssxkb3mfgx6lbjahmgr4kep@fvpmciimfikg>
 <f5228d559599f0670e6cbf26352bd1f1.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5228d559599f0670e6cbf26352bd1f1.sboyd@kernel.org>

On Thu, Mar 13, 2025 at 01:22:28PM -0700, Stephen Boyd wrote:
> Quoting Inochi Amaoto (2025-03-12 18:08:11)
> > On Wed, Mar 12, 2025 at 04:43:51PM -0700, Stephen Boyd wrote:
> > > Quoting Inochi Amaoto (2025-03-12 16:29:43)
> > > > On Wed, Mar 12, 2025 at 04:14:37PM -0700, Stephen Boyd wrote:
> > > > > Quoting Inochi Amaoto (2025-03-11 16:31:29)
> > > > > > 
> > > > > > > or if that syscon node should just have the #clock-cells property as
> > > > > > > part of the node instead.
> > > > > > 
> > > > > > This is not match the hardware I think. The pll area is on the middle
> > > > > > of the syscon and is hard to be separated as a subdevice of the syscon
> > > > > > or just add  "#clock-cells" to the syscon device. It is better to handle
> > > > > > them in one device/driver. So let the clock device reference it.
> > > > > 
> > > > > This happens all the time. We don't need a syscon for that unless the
> > > > > registers for the pll are both inside the syscon and in the register
> > > > > space 0x50002000. Is that the case? 
> > > > 
> > > > Yes, the clock has two areas, one in the clk controller and one in
> > > > the syscon, the vendor said this design is a heritage from other SoC.
> > > 
> > > My question is more if the PLL clk_ops need to access both the syscon
> > > register range and the clk controller register range. What part of the
> > > PLL clk_ops needs to access the clk controller at 0x50002000?
> > > 
> > 
> > The PLL clk_ops does nothing, but there is an implicit dependency:
> > When the PLL change rate, the mux attached to it must switch to 
> > another source to keep the output clock stable. This is the only
> > thing it needed.
> 
> I haven't looked at the clk_ops in detail (surprise! :) but that sounds
> a lot like the parent of the mux is the PLL and there's some "safe"
> source that is needed temporarily while the PLL is reprogrammed for a
> new rate. Is that right? I recall the notifier is in the driver so this
> sounds like that sort of design.

You are right, this design is like what you say. And this design is 
the reason that I prefer to just reference the syscon node but not
setting the syscon with "#clock-cell".

Regards,
Inochi
