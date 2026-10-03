Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC494519B9
	for <sophgo@lists.linux.dev>; Sat,  3 Oct 2026 16:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791044617; cv=none; b=Z015vcMlsEKHR+5MRhaErl8/w47r3VJOn8NbfHwkacpTYxo3foSR/ZLskjVoeYYZf+4usV41bOxOY1/NAX48V8UE2r/I6IB3fiBpqf2DfghF9mRBG66+uImO4X/X7TTzLrtiBhdzT4wOMtzycCKQmWo116x5FelBmCBkQCMORY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791044617; c=relaxed/simple;
	bh=vgdhw8rACnZl7y0Wg1EtOUtcX8opsAU4+r/FkpeeN1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NybuU5e/R51V8cyHT4sZmiSGtTuVgW34CJykgim9/adElX/BrZiG/COvwrbsykuO3D5Imuy2WO5efVUqUU5SlVgugUlf3nxNkg7ClMwItUKHcMvvNhpNZkaCZJqKT3Ja5eboNIFvLfEdQebTvYx/en1G8WjL0aAzBMWRw/pXWQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=OTy8G0ty; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="OTy8G0ty"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1438d9363fbso97092c88.0
        for <sophgo@lists.linux.dev>; Sat, 03 Oct 2026 09:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791044613; x=1791649413; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jxWbkNMJ0gxrVSfCconXVhPE8tqLr4BtV3xGSiKP/9w=;
        b=OTy8G0tyaUNtQdOYuHQUDwZxtzPNqphK4Y5soGf53Vies6DAOJJcjsjHiJuqJkVHaX
         2aSs33cgg0B9uQ5VXejwaz3udsPG2Z2c6UIc/72ypPKSBBPQYFQMa1FA3jW+zXpNIBVy
         jzReUmmoju8OEK1WxL8Ex06BgPBKT5fn0BBNo6KDPOGyT/4EE9SF8CE9NPR4reE4R7P6
         8/cnoOa/2trAhtC+sdqFG1O9noZo72FoUTF/OFrPhwLLY/+Fl093Fz91Mu81c7AZ2xm2
         Wk9FMcPMs/R0VWCW5TAKP+n9Daq4bW0qqDxuatf2J8uISYXWJe5zAIC6/HngJkAKhJGb
         qC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791044613; x=1791649413;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxWbkNMJ0gxrVSfCconXVhPE8tqLr4BtV3xGSiKP/9w=;
        b=wEj6N697VFdRw2KQaSmtpmX5i9rnoOrzs0CrVts6XLyNYfY8rZ3VXwA2REm9KIvupg
         dXb7UnnhZ99i/vPo/3kSv7SSOLWYQ6FFhfgm5hsvRsoWDV0ZLipvYg2rw1+M6KH/QDw/
         /j1OIsMSTBUkYPw6f3/WSfOej2HbxavQ97KGITSAmE32/mHB8iY93ZY0S0+T+8oOnMWs
         1K36R2ExctlVYXGNHdR5S/7AhEKX2u1uUBjm1tsjJEx94PfqmFFGY39xSV8bOEwQlqah
         L+1LudsuRGyERg59bGMddorr24ESYzXgE5hMorNQtTo9XRqocP37Grajo7H7V31XsZwW
         KmYA==
X-Forwarded-Encrypted: i=1; AKwUvBxQSHMuRUjOQVukvKo/PYBlwm0kxEMWGuiA794w8eIsoxGfUwSHEjwiIHOz+bDbbRNFb6lvYBQ=@lists.linux.dev
X-Gm-Message-State: AFuF++nRG2zcPe1Hy5LTKyB8p/gqzAOV4z3Z1d1C1RTRHy2IFJQyK2lf
	7UEpTyNN0bXzgFol5LgSH8xih95mxaPfjs7bEYe24+wBO2vLIIuMjPhckOnISWsWjO8=
X-Gm-Gg: AYBFou1sd57mlxGb7gtRyKrzUc/es9B6OGzqlIpNtbepeWzzzcHCvGjwLLuAK0JP8Qy
	uTbUY+ArrzmSuygk/qFpZw7Hnrn4Ah9hWHkcGv/vVy8TaT9qtW9+RvZgROXnZyrEqUDUaN8nLZH
	F48QNFh03MMTMa/Bky2EocalhRjbfeIQGx11v6RLeoQWcFAyHOAMnyy+PhyO/lxKTI9cWFpdpmy
	zCP7nH8gnt8/CMvyHBYPKfvA/7/7HfJjCB0+zWHK+xYz54eYRQMv4xaYDQN/e6Wy11EdMWG1OlC
	xczsQtORkA0cWdHEP/3sk+8S3U617UmqHKnyJAZISOzso8LCc+gAk25wnD6OGgbL/gbEd8th1t7
	W2LoQjBHeot45F7hhNyDw4exU4rJb17EyM8RyTH4kYIMpCuhxni5cUBbrSx++fYwOaRr1jx0s6Y
	bcfhVoGKVtYkI+RbsLSKBOL2v0phRNjcMhvlyKkL/xvY7T6GDgov0LtATd70SXHGEZUq1/EesoX
	qXnnJzxmx/E+NeLj9YXZ8gh5XznGEmzTepe/aDv0/fbNP8PXVenP+8s1aEDJg==
X-Received: by 2002:a05:7022:4386:b0:152:97a1:dd36 with SMTP id a92af1059eb24-15297a1ddc9mr3493127c88.10.1791044612830;
        Sat, 03 Oct 2026 09:23:32 -0700 (PDT)
Received: from hiagonb ([2804:7f0:9541:40e1:2108:ffa6:f94b:baff])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3511d87cfa7sm3498737eec.26.2026.10.03.09.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:23:32 -0700 (PDT)
Date: Sat, 3 Oct 2026 13:23:23 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Longbin Li <looong.bin@gmail.com>, "Anton D. Stavinskii" <stavinsky@gmail.com>, 
	Joshua Milas <josh.milas@gmail.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy
 node name
Message-ID: <asErZOk1RtzqC7Ao@hiagonb>
References: <20261003084627.353899-1-chenyou910331@gmail.com>
 <20261003084627.353899-3-chenyou910331@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003084627.353899-3-chenyou910331@gmail.com>

Hi Chen-Yu,

On Sat, Oct 03, 2026 at 04:46:26PM +0800, Chen-Yu Yeh wrote:
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

My only comment here is that I belive you should remove the newline
between "Fixes" and the "Reviewed-by".

> 
> Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
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

Best regards,
-- 
Hiago
