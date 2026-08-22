Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5181C2FF675
	for <sophgo@lists.linux.dev>; Sat, 22 Aug 2026 02:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787364920; cv=none; b=jUknac1dBf2dLZexipKrffVhkZGxZek/waz5C8PX/QBAhPXww+Ri1wBJR6R6N18FeDLLUR/+AJq3PSr4uLHoeKF9zVq/r2Pm62kBXTS9JAbNbuyO09/BZ7NNh3uIdVpsm3j9ZMyC6ZdRvFNwXyclEfxXTP/bfYrtYg9YXlOB5e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787364920; c=relaxed/simple;
	bh=mD5xjXCGIl4YFPLhqSxXfqSUdA/Yx43BvWrOBmOpsuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dzdWlReXaNiJBA8S7nSz8cR23yB5hChIMXavdd6zjJIjZ3TOos7FwoYwM2jJi/6rAUf1zzxsfZu7DzW4M8fXxO+STNzXCutv4yjSGQQJstS/sHn6NmpdDNwZrlbFkJC1la4i8z+ywE6Yr5KznGve0qUGjBSzJheeAQa14Jk2CxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ivrm78mn; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ivrm78mn"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-382ef647e20so1693101a91.1
        for <sophgo@lists.linux.dev>; Fri, 21 Aug 2026 19:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787364915; x=1787969715; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w9puE3+zCLEaWdw8EId49ZyEBO5d5Da/X77xZvHMcX4=;
        b=Ivrm78mnBcRE8+5cWNvQ5Kf+m1OPgRcEbEvfg/uAyBkjyaNGx7TbbfGXtnGx+UbxP5
         FT3w25WBTWW3q4XJLnN/ba2YJKOkJbvLJLacFAO6QPiBlvxnYOqNglgPZBHYQMN2cQNU
         TdDmoWG6SiyhHjndYZXUI4lc2HzrcqEk7tWIfN9l2l9xoWCUEkzNNVmYYKVntbDnyLmi
         d31gAt7QcB1NtpdClp8nIsSfKCWkRwTduCOg+hsjTg4/J17QZdADXwSAsXczRRtFkJPA
         xez35KQZMpH+ZWfxGdNt+JxGVWmtOpAF0W/0zzBIxQZFOO/zTF+ohphc+bOpVDGM3TCD
         E3IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787364915; x=1787969715;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9puE3+zCLEaWdw8EId49ZyEBO5d5Da/X77xZvHMcX4=;
        b=Mw4EDyWClNoEk7zx4LtLPW6A6HW7X5BoOix3xU/cXWuNGoSMvIcyrGXxFeTOZoex3b
         ZDTTf0wGklVm2Xo/tOzjaLCjd00UGCQ1AzRaprBvlaczle4zIjLY57rhZkNV4nYOqUeu
         RwyuMZpxbSSMQ9zuxorqz1yDFeSS5GzBnlQ3JLryNpOhzwp13+ndpoEVm3E7VvWgLP9v
         349J/a1Btgkb3QrKyZ8g/7D31cYDyVBup4mt8R4NJiDveXGlanwi7C5In+YoH0j48Enj
         RTUqf1cNYMFfMwaSXGsFOR53lzpLT1yYcRc5YVEMlQ10jOfNKHoQVmlTSvOAGXOQuJI2
         lG+g==
X-Forwarded-Encrypted: i=1; AHgh+RonTf94x/5dXepK0yVWUb4IHXvIFsssYBOtoDMo1UVbwy58Hb2TTpUYLs3ldBRlWvyqSctSIFY=@lists.linux.dev
X-Gm-Message-State: AFuF++mFKOJHTyomSkzgW3CRoQN5S6C7n/kL/7xsrtyjpb6VommF99jT
	1R0gShvXmvbuiA9aFLYArgyW5sLoVG5PgBJOUIERT7QXqS831VYJ2a2y
X-Gm-Gg: AR+sD10p6A/DK08FgdgIe4U+tRVV7kK0xogYYdq5jprH6Nvk/GDemOsWECR0HiKokR9
	7kcqBVYtDu9LeY1Ff6DfZdq05t20uj7bMLvGeYxE7n5h13qD3G6uXSna5t0mMHw8kfzoxzTBXby
	4KoYejkJrcNdGewJt1I8jNtrSnDysoM67/MFriL4vdkyTWkfxiz+weC2ApjmGtzhYbns8TBipEQ
	QGbhOWEJivssMjQLG0vLbUyhb5/kqTmrzF64Wh3KtFK4TMFecFBktv1ABjxKuW1NjwfklAUrFit
	yH/s+YZinF+llbD7xqc2BMCPKbfJkrgcmLPkCn4ehqcaRMUQ1cqdya+qA3qHmI1WQ0mHcVDVG9i
	RdeM/vLiLrs5vpkV0ZSAL7vEjafKAf/Y+tfkccR/vKq3vzdD6slFfVh0yO8uPe3Al7uNgWOdVHn
	XEmfeRSNVaaTChvty+Tp2cckTAbT3IS9lP0FapgW7Usk8CA6dEwlwKsRWQzLE=
X-Received: by 2002:a17:90b:4b89:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-395deeae6e3mr4932581a91.6.1787364915420;
        Fri, 21 Aug 2026 19:15:15 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49d8b1csm1062983a91.11.2026.08.21.19.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 19:15:15 -0700 (PDT)
Date: Sat, 22 Aug 2026 10:15:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>, chen.wang@linux.dev, 
	inochiama@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Longbin Li <looong.bin@gmail.com>, "Anton D. Stavinskii" <stavinsky@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node
 name
Message-ID: <aokF9v3orE3nBz4D@inochi.infowork>
References: <20260803163427.74445-1-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803163427.74445-1-chenyou910331@gmail.com>

On Tue, Aug 04, 2026 at 12:34:24AM +0800, Chen-Yu Yeh wrote:
> The internal EPHY node is named "phy@0" while its reg property is <1>.
> The unit-address should match the first entry of the reg property, but
> this is not checked by dtc for MDIO buses. The kernel confirms the PHY
> is indeed at address 1:
> 
>   eth0: PHY [mdio_mux-0.0:01] driver [Generic PHY]
> 
> Rename the node to ethernet-phy@1, which also follows the common naming
> convention for ethernet PHY nodes.
> 
> Fixes: ba1abacc57cb ("riscv: dts: sophgo: Add mdio multiplexer device for cv18xx")
> 
> Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> index ec3bf305274a..cf672cc6b935 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -71,7 +71,7 @@ internal_mdio: mdio@0 {
>  				#size-cells = <0>;
>  				reg = <0>;
>  
> -				internal_ephy: phy@0 {
> +				internal_ephy: phy@1 {
>  					compatible = "ethernet-phy-ieee802.3-c22";
>  					reg = <1>;
>  				};
> -- 
> 2.43.0
> 

Please send this with the same thread of PATCH 1. Otherwise, LGTM

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

Regards,
Inochi
