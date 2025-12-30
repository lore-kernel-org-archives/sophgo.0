Received: from mail2.viabit.com (mail2.viabit.com [65.246.80.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB560334C31
	for <sophgo@lists.linux.dev>; Tue, 30 Dec 2025 23:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.246.80.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767135905; cv=none; b=fxh0ZbZRORbRI209Pp5egTTjbzQAZcDHH60qfnG8LEeEApMLQzWx7nVctBS8Amh7zZgz2W46KCFzUl7N2gqMastEWtdPaBEvEFD2nP5WHsl8h+2VPDmYj4crkljaH3IFfKU4RH72UpuKPAzRFVz2SkoX3iI6asagDuM2gs1OMhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767135905; c=relaxed/simple;
	bh=fO4n52ezPi+nD6rTBKgn20j4yAMnHBe5/BUJW4kWIfg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NgKFrhtrE3zNtTm7j5cPR7A+C22AHCeimGt+J//+rhq2dO5o8UwWCjaoT4tUovAwlaQcmAkI/bAl7JMrdz3y1BM7OPdGRuhesa976P9I6w2P7UedwzP/Bb5GhAzpjuVm6Rxe/tKwx3toM40CAcX9YUafOclMCubfkeyZA/8D+J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com; spf=pass smtp.mailfrom=orlitzky.com; dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b=HZ4HMqin; arc=none smtp.client-ip=65.246.80.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orlitzky.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=orlitzky.com header.i=@orlitzky.com header.b="HZ4HMqin"
Received: from mertle.michael.orlitzky.com (unknown [76.111.14.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.viabit.com (Postfix) with ESMTPSA id 4dgpPM17qjz3wtH
	for <sophgo@lists.linux.dev>; Tue, 30 Dec 2025 17:56:54 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=orlitzky.com; s=mail2;
	t=1767135415; bh=fO4n52ezPi+nD6rTBKgn20j4yAMnHBe5/BUJW4kWIfg=;
	h=Date:From:To:Subject;
	b=HZ4HMqinqJIexj5boMx+TF6CIxmsLkM0Gu3Llir8qLDDrRP9vMp95uC+f7VZ1TUqK
	 uBW95xP/zCn/iKK3Wne/Ubij3fg1voEgN7c56cPeYc4ZIkrIDgnRQUvPyy19NHNIdf
	 VzHyJS5R7KiWCeeCI9INquC+f/Z2Od0h7GDDBvCY=
Received: by mertle.michael.orlitzky.com (Postfix, from userid 1000)
	id 562D012C340E; Tue, 30 Dec 2025 17:56:54 -0500 (EST)
Date: Tue, 30 Dec 2025 17:56:54 -0500
From: Michael Orlitzky <michael@orlitzky.com>
To: sophgo@lists.linux.dev
Subject: Hardware clock on the Pioneer
Message-ID: <aVRYtrWucN0x4wNm@mertle>
Precedence: bulk
X-Mailing-List: sophgo@lists.linux.dev
List-Id: <sophgo.lists.linux.dev>
List-Subscribe: <mailto:sophgo+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sophgo+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, I finally have the upstream kernel running on my Pioneer Box,
and I notice that the hardware clock is not enabled. I've patched this
in my own kernel (sg2042-milkv-pioneer.dts) by enabling i2c0, defining
the RTC,

  &i2c0 {
    pinctrl-0 = <&i2c0_cfg>;
    pinctrl-names = "default";
    status = "okay";

      rtc: rtc@68 {
        compatible = "dallas,ds1307";
        reg = <0x68>;
    };
  };

and copying the pinctrl bits from i2c1:

  i2c0_cfg: i2c0-cfg {
    i2c0-pins {
      pinmux = <PINMUX(PIN_IIC0_SDA, 0)>,
               <PINMUX(PIN_IIC0_SCL, 0)>;
      bias-pull-up;
      drive-strength-microamp = <26800>;
      input-schmitt-enable;
    };
  };

It seems to work:

  $ sudo hwclock --show
  2025-12-30 17:54:05.093606-05:00

Is there a reason not to do this? The sophgo upstream status page says
that the RTC is "Low priority, may not be needed." But if the above is
OK, I will submit a patch for it.
