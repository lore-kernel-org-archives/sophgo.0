Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35F421B9C0;
	Wed, 29 Oct 2025 05:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761717423; cv=none; b=n6mBJVdt02BSbEwLYhQpxxCW5nnY45di6p+DAOjM5RdH7syNuFapuxVYb7gASJQRkPoepItiSqSfKu+licT5WtYaE6Afyj0l0XCaxAG3Bl0GlMGPKqiLkHDC3D3fFACxmU4QjJ095IK0+POmmsbdE4h35C6ROe1yoV6AwsLRm/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761717423; c=relaxed/simple;
	bh=e+hYAF80RGk08jB65h35DfRu85xR11EJdxJCJuqcKwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aARpNUMYZoBwIeZoMn63SUrmBlig5LlltbtFUpX+kobdAZyHMvR1gxvupqiyFJ4jozMSzX+G6TK3DntBA9dcAZ+/+yZKFFbSPTtjPhFSX87zkG+aeokVYZB9gIder8hyYtCbX9xei1Ab0JonMlpFNrMpBlyw696CTy7ilAvzr5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PGPCgxf6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PGPCgxf6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D585C4CEF7;
	Wed, 29 Oct 2025 05:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761717423;
	bh=e+hYAF80RGk08jB65h35DfRu85xR11EJdxJCJuqcKwc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PGPCgxf6ZFqrptSm7Jbd2ngFAvekoHnAfI2QRFg+UAXVx/ZfObVYO0UpoGBZmfbK6
	 frf5Txgvj2WkVGHsPSMa8xP/7Rns9lqtjrjQtnQS37n+FgVgxLorqXXbg9dvBgMi5T
	 /At36bRTs6tqlVSTb2ue0aDU8z7KneZEXc2gXAxiPSz7NYyPVXN5g5kK2/sjXZeelf
	 c6VlfRwU6Hz5qlllhowkhvpuhePqeN7/xVrzi2oxzW9yFcBOEZI3B74TWSM7nPW6vI
	 P8MsTizs6Zhrjf32zhmEEBUakLJd9yHQSVuqVtvrIOuoO79jCLkAzm27zx8YuyWKGW
	 ohx61e17+dygA==
Date: Wed, 29 Oct 2025 06:57:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Joshua Milas <josh.milas@gmail.com>
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, unicorn_wang@outlook.com, inochiama@gmail.com, 
	paul.walmsley@sifive.com, samuel.holland@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, alexander.sverdlin@gmail.com, 
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com, chao.wei@sophgo.com, 
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/5] Add initial Milk-V Duo S board support
Message-ID: <20251029-successful-pristine-ara-bd4d23@kuoka>
References: <20251029001052.36774-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251029001052.36774-1-josh.milas@gmail.com>

On Tue, Oct 28, 2025 at 08:10:47PM -0400, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> Ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been
> tested with ARM64 and RISCV64 to boot from an SD card, have
> networking, and read I2C slave devices over i2c4.
> 
> v3
> - Added sg2000 interrupt controller and timer to documentation
> - Added sg2000.dtsi for RISCV and moved DTS over to use it
> - remove devices from DTS's to match what is available in the
>   default pinmux config. spi0-2, i2c0-3, uart1-4
> - Added i2c4 and spi3 aliases

How did you resolve previous comments on bindings? Nothing mentioned
here.

Best regards,
Krzysztof

